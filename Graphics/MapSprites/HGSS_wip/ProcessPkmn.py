#!/usr/bin/env python3
"""Build HGSS-style Pokemon SMS/MMS strips from the raw Gen 1 sheet."""

from __future__ import annotations

import argparse
from functools import lru_cache
from pathlib import Path

from PIL import Image


SCRIPT_DIR = Path(__file__).resolve().parent
RAW_DIR = SCRIPT_DIR / "Raw"
DEFAULT_SMS_DIR = SCRIPT_DIR / "SMS"
DEFAULT_MMS_DIR = SCRIPT_DIR / "MMS"
DEFAULT_SOURCE_NAME = "Overworld Pokmon Generation 1.png"
DEFAULT_PALETTE_NAME = "Overworld Pokmon Generation 1 pal2.png"

SOURCE_FRAME_WIDTH = 33
SOURCE_FRAME_HEIGHT = 42
TARGET_FRAME_SIZE = 32
SMS_SIZE = (32, 96)
MMS_SIZE = (32, 480)
POKEMON_COUNT = 151

SMS_FRAME_COLUMNS = (0, 0, 1)
MMS_FRAME_COLUMNS = (
    4, 5, 4, 5,  # side
    0, 1, 0, 1,  # down
    2, 3, 2, 3,  # up
    0, 0, 1,     # hover
)


def source_image_path(path: Path | None) -> Path:
    if path:
        return path.resolve()

    preferred = RAW_DIR / DEFAULT_SOURCE_NAME
    if preferred.exists():
        return preferred

    candidates = sorted(path for path in RAW_DIR.glob("*.png") if path.is_file())
    if not candidates:
        raise FileNotFoundError(f"No PNG source sheet found in {RAW_DIR}")
    return candidates[0]


def first_palette(image: Image.Image) -> list[int]:
    palette = image.getpalette()
    if not palette:
        raise ValueError("source sheet must be paletted")
    palette = palette[:]
    palette.extend([0] * (768 - len(palette)))
    return palette[:768]


def palette_image_path(path: Path | None) -> Path:
    if path:
        return path.resolve()

    preferred = RAW_DIR / DEFAULT_PALETTE_NAME
    if preferred.exists():
        return preferred

    raise FileNotFoundError(f"No palette source sheet found at {preferred}")


def palette_colors(palette: list[int]) -> list[tuple[int, int, int]]:
    return [tuple(palette[index * 3 : index * 3 + 3]) for index in range(16)]


@lru_cache(maxsize=None)
def nearest_palette_index(rgb: tuple[int, int, int], colors_key: tuple[tuple[int, int, int], ...]) -> int:
    colors = list(colors_key)
    return min(range(1, 16), key=lambda index: sum((rgb[channel] - colors[index][channel]) ** 2 for channel in range(3)))


def quantize_to_palette(image: Image.Image, palette: list[int], transparency_mask: Image.Image) -> Image.Image:
    colors_key = tuple(palette_colors(palette))
    rgb = image.convert("RGB")
    mask = transparency_mask.convert("L")
    indexed = Image.new("P", rgb.size, 0)
    indexed.putpalette(palette)
    indexed.putdata([
        0 if alpha == 0 else nearest_palette_index(color, colors_key)
        for color, alpha in zip(rgb.getdata(), mask.getdata())
    ])
    return indexed


def row_mask_bits(mask: Image.Image, row: int) -> int:
    row_mask = mask.crop((0, row * SOURCE_FRAME_HEIGHT, mask.width, (row + 1) * SOURCE_FRAME_HEIGHT))
    bits = 0
    for index, alpha in enumerate(row_mask.getdata()):
        if alpha:
            bits |= 1 << index
    return bits


def mask_similarity(left: int, right: int) -> float:
    union = (left | right).bit_count()
    if union == 0:
        return 1.0
    return (left & right).bit_count() / union


def align_source_to_palette_rows(source: Image.Image, source_mask: Image.Image, palette_source: Image.Image) -> tuple[Image.Image, Image.Image, list[int]]:
    source_rows = source.height // SOURCE_FRAME_HEIGHT
    target_rows = min(POKEMON_COUNT, palette_source.height // SOURCE_FRAME_HEIGHT)
    palette_mask = palette_source.point(lambda pixel: 0 if pixel == 0 else 255, "L")

    source_bits = [row_mask_bits(source_mask, row) for row in range(source_rows)]
    target_bits = [row_mask_bits(palette_mask, row) for row in range(target_rows)]
    scores = [
        [mask_similarity(target, candidate) for candidate in source_bits]
        for target in target_bits
    ]

    impossible = -1.0
    dp = [[impossible] * source_rows for _ in range(target_rows)]
    previous = [[-1] * source_rows for _ in range(target_rows)]
    for source_row in range(source_rows):
        dp[0][source_row] = scores[0][source_row]

    for target_row in range(1, target_rows):
        best_score = impossible
        best_source_row = -1
        for source_row in range(source_rows):
            if best_source_row != -1:
                dp[target_row][source_row] = best_score + scores[target_row][source_row]
                previous[target_row][source_row] = best_source_row
            if dp[target_row - 1][source_row] > best_score:
                best_score = dp[target_row - 1][source_row]
                best_source_row = source_row

    source_row = max(range(source_rows), key=lambda row: dp[target_rows - 1][row])
    row_map: list[int] = []
    for target_row in range(target_rows - 1, -1, -1):
        row_map.append(source_row)
        source_row = previous[target_row][source_row]
    row_map.reverse()

    aligned_source = Image.new("RGB", (source.width, target_rows * SOURCE_FRAME_HEIGHT))
    aligned_mask = Image.new("L", (source.width, target_rows * SOURCE_FRAME_HEIGHT), 0)
    source_rgb = source.convert("RGB")
    for target_row, source_row in enumerate(row_map):
        target_box = (0, target_row * SOURCE_FRAME_HEIGHT)
        source_box = (0, source_row * SOURCE_FRAME_HEIGHT, source.width, (source_row + 1) * SOURCE_FRAME_HEIGHT)
        aligned_source.paste(source_rgb.crop(source_box), target_box)
        aligned_mask.paste(source_mask.crop(source_box), target_box)

    return aligned_source, aligned_mask, row_map


def source_transparency_mask(image: Image.Image) -> Image.Image:
    rgb = image.convert("RGB")
    background_colors: set[tuple[int, int, int]] = set()
    sample_points = [
        (x, y)
        for x in range(min(4, rgb.width))
        for y in range(min(4, rgb.height))
    ]
    sample_points.extend(
        (rgb.width - 1 - x, rgb.height - 1 - y)
        for x in range(min(4, rgb.width))
        for y in range(min(4, rgb.height))
    )
    for point in sample_points:
        background_colors.add(rgb.getpixel(point))

    mask = Image.new("L", rgb.size, 255)
    mask.putdata([0 if color in background_colors else 255 for color in rgb.getdata()])
    return mask


def transparent_mask(frame: Image.Image) -> Image.Image:
    if frame.mode == "P":
        return frame.point(lambda pixel: 0 if pixel == 0 else 255, "L")
    return frame.convert("RGBA").getchannel("A")


def fit_frame(frame: Image.Image, palette: list[int]) -> Image.Image:
    mask = transparent_mask(frame)
    bbox = mask.getbbox()
    output = Image.new("P", (TARGET_FRAME_SIZE, TARGET_FRAME_SIZE), 0)
    output.putpalette(palette)

    if bbox is None:
        return output

    cropped = frame.crop(bbox)
    cropped_mask = mask.crop(bbox)

    if cropped.width > TARGET_FRAME_SIZE or cropped.height > TARGET_FRAME_SIZE:
        left = max(0, (cropped.width - TARGET_FRAME_SIZE) // 2)
        top = max(0, cropped.height - TARGET_FRAME_SIZE)
        crop_box = (
            left,
            top,
            min(left + TARGET_FRAME_SIZE, cropped.width),
            min(top + TARGET_FRAME_SIZE, cropped.height),
        )
        cropped = cropped.crop(crop_box)
        cropped_mask = cropped_mask.crop(crop_box)

    x = (TARGET_FRAME_SIZE - cropped.width) // 2
    y = TARGET_FRAME_SIZE - cropped.height
    output.paste(cropped, (x, y), cropped_mask)
    return output


def source_frame(sheet: Image.Image, row: int, column: int, palette: list[int]) -> Image.Image:
    box = (
        column * SOURCE_FRAME_WIDTH,
        row * SOURCE_FRAME_HEIGHT,
        (column + 1) * SOURCE_FRAME_WIDTH,
        (row + 1) * SOURCE_FRAME_HEIGHT,
    )
    return fit_frame(sheet.crop(box), palette)


def paste_frames(frames: list[Image.Image], size: tuple[int, int], palette: list[int]) -> Image.Image:
    output = Image.new("P", size, 0)
    output.putpalette(palette)
    for index, frame in enumerate(frames):
        output.paste(frame, (0, index * TARGET_FRAME_SIZE))
    return output


def display_path(path: Path) -> Path:
    try:
        return path.relative_to(SCRIPT_DIR)
    except ValueError:
        return path


def process_pokemon(sheet: Image.Image, number: int, sms_dir: Path, mms_dir: Path, overwrite: bool, dry_run: bool) -> bool:
    palette = first_palette(sheet)
    row = number - 1

    sms_path = sms_dir / f"{number}.png"
    mms_path = mms_dir / f"r{number}.png"
    output_paths = [path for path in (sms_path, mms_path) if overwrite or not path.exists()]
    if not output_paths:
        return False

    if dry_run:
        print("Would write " + " and ".join(str(display_path(path)) for path in output_paths))
        return True

    sms_dir.mkdir(parents=True, exist_ok=True)
    mms_dir.mkdir(parents=True, exist_ok=True)

    sms_frames = [source_frame(sheet, row, column, palette) for column in SMS_FRAME_COLUMNS]
    mms_frames = [source_frame(sheet, row, column, palette) for column in MMS_FRAME_COLUMNS]

    if sms_path in output_paths:
        paste_frames(sms_frames, SMS_SIZE, palette).save(sms_path, optimize=True)
    if mms_path in output_paths:
        paste_frames(mms_frames, MMS_SIZE, palette).save(mms_path, optimize=True)
    print("Wrote " + " and ".join(path.name for path in output_paths))
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, help="Raw source sheet. Defaults to the Gen 1 RGB sheet in Raw.")
    parser.add_argument("--palette-source", type=Path, help="Indexed sheet whose palette should be used for output.")
    parser.add_argument("--sms-dir", type=Path, default=DEFAULT_SMS_DIR)
    parser.add_argument("--mms-dir", type=Path, default=DEFAULT_MMS_DIR)
    parser.add_argument("--start", type=int, default=1)
    parser.add_argument("--count", type=int, default=151)
    parser.add_argument("--overwrite", action="store_true", help="Replace existing SMS/MMS outputs.")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be written without changing files.")
    args = parser.parse_args()

    source_path = source_image_path(args.source)
    palette_source_path = palette_image_path(args.palette_source)
    palette_source = Image.open(palette_source_path)
    if palette_source.mode != "P":
        raise ValueError(f"{palette_source_path.name} must be paletted; got mode {palette_source.mode}")

    palette = first_palette(palette_source)
    source = Image.open(source_path)
    if source.size != palette_source.size:
        raise ValueError(f"{source_path.name} and {palette_source_path.name} must have the same dimensions")
    transparency_mask = source_transparency_mask(source)
    aligned_source, aligned_mask, row_map = align_source_to_palette_rows(source, transparency_mask, palette_source)
    skipped_rows = sorted(set(range(1, source.height // SOURCE_FRAME_HEIGHT + 1)) - {row + 1 for row in row_map})
    if skipped_rows:
        print("Skipped source row(s) not present in palette order: " + ", ".join(str(row) for row in skipped_rows))
    sheet = quantize_to_palette(aligned_source, palette, aligned_mask)

    available_rows = sheet.height // SOURCE_FRAME_HEIGHT
    end = min(args.start + args.count - 1, available_rows)
    if args.start < 1 or args.start > end:
        raise ValueError(f"invalid range: start={args.start}, available rows={available_rows}")

    processed = 0
    for number in range(args.start, end + 1):
        if process_pokemon(sheet, number, args.sms_dir.resolve(), args.mms_dir.resolve(), args.overwrite, args.dry_run):
            processed += 1

    action = "Would write" if args.dry_run else "Wrote"
    print(f"{action} {processed} Pokemon sprite set(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
