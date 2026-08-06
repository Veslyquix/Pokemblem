import argparse
import re
import struct
import unicodedata
from pathlib import Path

from PIL import Image

from MakeGlyphInstaller import ParseGlyphFileName


ROOT = Path(__file__).resolve().parent
DEFAULT_TEXT = ROOT / "Chinese" / "text_buildfile.txt"
DEFAULT_FONT_DIR = ROOT / "FontData"
DEFAULT_ROM = ROOT.parent / "Pokemblem_Chinese1.20.gba"
DEFAULT_REPORT = ROOT / "missing_chinese_glyphs.txt"

TEXT_TABLE_OFFSET = 0x58F6F4
GLYPH_SIZE = 0x48
GLYPH_BITMAP_OFFSET = 8

CONTROL_RE = re.compile(r"\[[^\]]*\]")


def glyph_char(path, prefix):
    try:
        kind, codepoint, stem = ParseGlyphFileName(path)
    except ValueError:
        return None

    if f"Font{kind}" != prefix:
        return None

    return chr(codepoint)


def collect_font_chars(font_dir, prefix):
    chars = set()

    for path in font_dir.glob(f"{prefix}*.png"):
        ch = glyph_char(path, prefix)
        if ch:
            chars.add(ch)

    return chars


def collect_used_chars(text_path):
    chars = {}
    replacements = {}

    for lineno, line in enumerate(text_path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        stripped = CONTROL_RE.sub("", line)

        for ch in stripped:
            if ord(ch) < 0x80 or ch in "\ufeff\r\n\t":
                continue

            if unicodedata.category(ch).startswith("C"):
                continue

            chars.setdefault(ch, []).append((lineno, line.strip()))

            if ch == "\ufffd":
                replacements.setdefault(lineno, line.strip())

    return chars, replacements


def pointer_to_offset(pointer, rom_size):
    if 0x08000000 <= pointer < 0x0A000000:
        return pointer - 0x08000000

    if 0 <= pointer < rom_size:
        return pointer

    return None


def read_u32(data, offset):
    return struct.unpack_from("<I", data, offset)[0]


def find_rom_glyph(rom, ch):
    codepoint = ord(ch)
    slot = codepoint & 0xFF
    codepoint_high = (codepoint >> 8) & 0xFF
    offset = pointer_to_offset(read_u32(rom, TEXT_TABLE_OFFSET + slot * 4), len(rom))
    seen = set()

    while offset is not None and offset not in seen and 0 <= offset <= len(rom) - GLYPH_SIZE:
        seen.add(offset)

        if rom[offset + 4] == codepoint_high:
            width = rom[offset + 5]
            bitmap = rom[offset + GLYPH_BITMAP_OFFSET:offset + GLYPH_BITMAP_OFFSET + 0x40]
            return width, bitmap

        offset = pointer_to_offset(read_u32(rom, offset), len(rom))

    return None


def decode_fefont(bitmap, palette):
    image = Image.new("P", (16, 16), 0)
    image.putpalette(palette)
    pixels = image.load()

    for i, packed in enumerate(bitmap):
        y = i // 4
        x = (i % 4) * 4

        pixels[x + 0, y] = (packed >> 0) & 0x03
        pixels[x + 1, y] = (packed >> 2) & 0x03
        pixels[x + 2, y] = (packed >> 4) & 0x03
        pixels[x + 3, y] = (packed >> 6) & 0x03

    return image


def load_palette(font_dir):
    sample = font_dir / "FontText你.png"

    if sample.exists():
        palette = Image.open(sample).getpalette()
        if palette:
            return palette

    return [224, 224, 224, 248, 248, 248, 168, 168, 167, 40, 40, 40] + [0, 0, 0] * 252


def write_report(path, used_chars, missing, extracted, not_found, replacements):
    lines = []

    lines.append(f"Used non-ASCII characters: {len(used_chars)}")
    lines.append(f"Missing FontText PNG glyphs: {len(missing)}")
    lines.append(f"Extracted from translated ROM: {len(extracted)}")
    lines.append(f"Not found in translated ROM: {len(not_found)}")
    lines.append("")

    if missing:
        lines.append("Missing characters:")
        lines.append("".join(missing))
        lines.append("")

    if not_found:
        lines.append("Not found:")
        lines.append("".join(not_found))
        lines.append("")

    if replacements:
        lines.append("Source lines containing U+FFFD replacement characters:")
        for lineno, sample in list(replacements.items())[:50]:
            lines.append(f"  line {lineno}: {sample}")
        lines.append("")

    lines.append("Samples:")
    for ch in missing:
        lineno, sample = used_chars[ch][0]
        name = unicodedata.name(ch, "<unnamed>")
        lines.append(f"U+{ord(ch):04X} {ch} {name} line {lineno}: {sample}")

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Find Chinese text glyphs missing from the FE8 UTF-8 text font.")
    parser.add_argument("--text", type=Path, default=DEFAULT_TEXT)
    parser.add_argument("--font-dir", type=Path, default=DEFAULT_FONT_DIR)
    parser.add_argument("--rom", type=Path, default=DEFAULT_ROM)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--extract-from-rom", action="store_true", help="Create missing FontText PNGs from the translated ROM font table.")
    args = parser.parse_args()

    used_chars, replacements = collect_used_chars(args.text)
    text_chars = collect_font_chars(args.font_dir, "FontText")
    missing = sorted((ch for ch in used_chars if ch not in text_chars and ch != "\ufffd"), key=ord)

    extracted = []
    not_found = []

    if args.extract_from_rom and missing:
        rom = args.rom.read_bytes()
        palette = load_palette(args.font_dir)

        for ch in missing:
            glyph = find_rom_glyph(rom, ch)
            if not glyph:
                not_found.append(ch)
                continue

            width, bitmap = glyph
            image = decode_fefont(bitmap, palette)
            image.save(args.font_dir / f"FontText{ch}.png")
            extracted.append(ch)

    elif missing:
        rom = args.rom.read_bytes() if args.rom.exists() else None
        if rom:
            for ch in missing:
                if not find_rom_glyph(rom, ch):
                    not_found.append(ch)

    write_report(args.report, used_chars, missing, extracted, not_found, replacements)

    print(f"Used non-ASCII characters: {len(used_chars)}")
    print(f"Missing FontText PNG glyphs: {len(missing)}")
    if missing:
        print("".join(missing))
    if extracted:
        print(f"Extracted from translated ROM: {len(extracted)}")
    if not_found:
        print(f"Not found in translated ROM: {len(not_found)}")
        print("".join(not_found))
    if replacements:
        print(f"U+FFFD replacement-character source lines: {len(replacements)}")
    print(f"Wrote report: {args.report}")


if __name__ == "__main__":
    main()
