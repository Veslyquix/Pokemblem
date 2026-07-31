#!/usr/bin/env python3
"""Process trainer strips from ``more`` into this folder.

Outputs are normalized to 160x32 and remapped to the shared FRLG raw trainer
palette used by the parent folder. Existing destination files are skipped
unless ``--overwrite`` is passed.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from pathlib import Path

from PIL import Image


SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_SOURCE_DIR = SCRIPT_DIR / "more"
FRAME_WIDTH = 16
OUTPUT_SIZE = (160, 32)


def palette_colors(palette: list[int]) -> list[tuple[int, int, int]]:
    return [tuple(palette[index * 3 : index * 3 + 3]) for index in range(16)]


def shared_parent_palette() -> tuple[list[int], list[tuple[int, int, int]]]:
    tails: dict[tuple[int, ...], Counter[tuple[int, int, int]]] = defaultdict(Counter)

    for path in sorted(SCRIPT_DIR.glob("*.png")):
        image = Image.open(path)
        palette = image.getpalette()
        if image.mode != "P" or not palette or len(palette) < 16 * 3:
            continue

        first_16 = palette[: 16 * 3]
        transparent = tuple(first_16[:3])
        tail = tuple(first_16[3:])
        tails[tail][transparent] += 1

    if not tails:
        raise ValueError(f"No paletted PNGs found in {SCRIPT_DIR}")

    shared_tail, transparent_counts = max(
        tails.items(),
        key=lambda item: (sum(item[1].values()), item[0]),
    )
    transparent = transparent_counts.most_common(1)[0][0]
    palette = list(transparent) + list(shared_tail)
    palette.extend([0] * (768 - len(palette)))
    return palette, palette_colors(palette)


def nearest_palette_index(rgb: tuple[int, int, int], colors: list[tuple[int, int, int]]) -> int:
    return min(range(1, 16), key=lambda index: sum((rgb[channel] - colors[index][channel]) ** 2 for channel in range(3)))


def rgba_with_transparency(source: Image.Image) -> Image.Image:
    rgba = source.convert("RGBA")
    if source.mode != "P":
        return rgba

    alpha = Image.new("L", source.size, 255)
    for y in range(source.height):
        for x in range(source.width):
            if source.getpixel((x, y)) == 0:
                alpha.putpixel((x, y), 0)
    rgba.putalpha(alpha)
    return rgba


def normalize_strip(source: Image.Image) -> Image.Image:
    if source.height not in (16, 32):
        raise ValueError(f"expected height 16 or 32, got {source.size[1]}")
    if source.width % FRAME_WIDTH:
        raise ValueError(f"expected width divisible by {FRAME_WIDTH}, got {source.size[0]}")

    output = Image.new("RGBA", OUTPUT_SIZE, (0, 0, 0, 0))
    source_rgba = rgba_with_transparency(source)
    source_frames = source.width // FRAME_WIDTH
    output_frames = OUTPUT_SIZE[0] // FRAME_WIDTH
    dest_y = OUTPUT_SIZE[1] - source.height

    for frame_index in range(output_frames):
        source_frame_index = frame_index if frame_index < source_frames else 0

        box = (
            source_frame_index * FRAME_WIDTH,
            0,
            (source_frame_index + 1) * FRAME_WIDTH,
            source.height,
        )
        output.alpha_composite(source_rgba.crop(box), (frame_index * FRAME_WIDTH, dest_y))

    return output


def remap_to_palette(source: Image.Image, palette: list[int], colors: list[tuple[int, int, int]]) -> Image.Image:
    normalized = normalize_strip(source)
    normalized_rgba = normalized.convert("RGBA")
    output = Image.new("P", OUTPUT_SIZE, 0)
    output.putpalette(palette)

    for y in range(OUTPUT_SIZE[1]):
        for x in range(OUTPUT_SIZE[0]):
            rgba = normalized_rgba.getpixel((x, y))
            if rgba[3] < 128:
                output.putpixel((x, y), 0)
            else:
                output.putpixel((x, y), nearest_palette_index(rgba[:3], colors))

    return output


def resolve_source_dir(path: Path | None) -> Path:
    if path:
        return path.resolve()
    if DEFAULT_SOURCE_DIR.exists():
        return DEFAULT_SOURCE_DIR

    alternate = SCRIPT_DIR / "More"
    if alternate.exists():
        return alternate
    return DEFAULT_SOURCE_DIR


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, help="Folder containing source PNGs. Defaults to ./more.")
    parser.add_argument("--overwrite", action="store_true", help="Replace existing PNGs in FRLGRawTrainers.")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be written without changing files.")
    args = parser.parse_args()

    source_dir = resolve_source_dir(args.source_dir)
    if not source_dir.exists():
        raise FileNotFoundError(source_dir)

    palette, colors = shared_parent_palette()
    written = 0
    skipped = 0

    for source_path in sorted(source_dir.glob("*.png")):
        output_path = SCRIPT_DIR / source_path.name
        if output_path.exists() and not args.overwrite:
            print(f"Skipping {source_path.name}; destination exists.")
            skipped += 1
            continue

        source = Image.open(source_path)
        output = remap_to_palette(source, palette, colors)

        if args.dry_run:
            print(f"Would write {output_path.name} from {source_path.relative_to(source_dir)}")
        else:
            output.save(output_path, optimize=True)
            print(f"Wrote {output_path.name}")
        written += 1

    action = "Would write" if args.dry_run else "Wrote"
    print(f"{action} {written} file(s); skipped {skipped} existing file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
