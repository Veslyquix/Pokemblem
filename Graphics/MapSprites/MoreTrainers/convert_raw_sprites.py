#!/usr/bin/env python3
"""Convert 4x4 raw overworld sheets into FRLG-style 160x32 strips.

Input files are read from a sibling ``raw`` folder. Outputs are written beside
this script as ``<name>.png``. The source sheet should be a 4x4 walking
sheet; both 128x192 SoulfulLex sheets and 256x256 Gen 4 sheets are supported.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import re
from pathlib import Path

from PIL import Image


SCRIPT_DIR = Path(__file__).resolve().parent
RAW_DIR = SCRIPT_DIR / "raw"
FRLG_RAW_DIR = SCRIPT_DIR.parent / "FRLGRawTrainers"

REFERENCE_ALIASES = {
    "surge": "ltsurge",
}

FRAME_WIDTH = 16
FRAME_HEIGHT = 32

# Destination order used by the current 160x32 trainer strips:
# down, up, side, down steps, up steps, side steps, down.
SOULFULLEX_FRAME_MAP = [
    (0, 0),
    (3, 0),
    (1, 0),
    (0, 1),
    (0, 3),
    (3, 1),
    (3, 3),
    (1, 1),
    (1, 3),
    (0, 2),
]

GEN4_FRAME_MAP = [
    (0, 0),
    (3, 0),
    (1, 0),
    (0, 1),
    (0, 3),
    (3, 1),
    (3, 3),
    (1, 1),
    (1, 3),
    (0, 2),
]

STANDING_FRAME_INDICES = {0, 1, 9}


def output_stem(path: Path) -> str:
    stem = re.sub(r"^Anime\s+", "", path.stem, flags=re.IGNORECASE)
    stem = re.sub(r"[^A-Za-z0-9]+", "_", stem).strip("_").lower()
    stem = stem.replace("_in_disguise", "")
    return stem or path.stem.lower()


def find_reference(stem: str) -> Path | None:
    lookup_stem = REFERENCE_ALIASES.get(stem, stem)
    for folder in (SCRIPT_DIR, FRLG_RAW_DIR):
        candidate = folder / f"{lookup_stem}.png"
        if candidate.exists():
            return candidate
    return None


def first_16_palette(image: Image.Image) -> tuple[list[int], list[tuple[int, int, int]]]:
    if image.mode == "P" and image.getpalette():
        palette = image.getpalette()[: 16 * 3]
        palette.extend([0] * (16 * 3 - len(palette)))
        colors = [tuple(palette[i * 3 : i * 3 + 3]) for i in range(16)]
        return palette, colors

    converted = image.convert("RGBA").quantize(colors=15, method=Image.Quantize.FASTOCTREE)
    raw_palette = converted.getpalette()[: 15 * 3]
    palette = [3, 255, 3] + raw_palette
    palette.extend([0] * (16 * 3 - len(palette)))
    colors = [tuple(palette[i * 3 : i * 3 + 3]) for i in range(16)]
    return palette, colors


def dominant_frlg_trainer_palette() -> tuple[list[int], list[tuple[int, int, int]]] | None:
    """Return the shared FRLG trainer palette used by most raw trainer strips."""
    tails: dict[tuple[int, ...], Counter[tuple[int, int, int]]] = defaultdict(Counter)

    for path in sorted(FRLG_RAW_DIR.glob("*.png")):
        image = Image.open(path)
        palette = image.getpalette()
        if image.mode != "P" or not palette or len(palette) < 16 * 3:
            continue

        first_16 = palette[: 16 * 3]
        transparent = tuple(first_16[:3])
        tail = tuple(first_16[3:])
        tails[tail][transparent] += 1

    if not tails:
        return None

    shared_tail, transparent_counts = max(
        tails.items(),
        key=lambda item: (sum(item[1].values()), item[0]),
    )
    transparent = transparent_counts.most_common(1)[0][0]
    palette = list(transparent) + list(shared_tail)
    palette.extend([0] * (16 * 3 - len(palette)))
    colors = [tuple(palette[i * 3 : i * 3 + 3]) for i in range(16)]
    return palette, colors


def used_palette_indices(image: Image.Image) -> list[int]:
    indices = sorted(set(image.getdata()))
    return [idx for idx in indices if 0 < idx < 16]


def nearest_index(rgb: tuple[int, int, int], colors: list[tuple[int, int, int]], candidates: list[int]) -> int:
    return min(candidates, key=lambda idx: sum((rgb[channel] - colors[idx][channel]) ** 2 for channel in range(3)))


def frame_bbox(frame: Image.Image) -> tuple[int, int, int, int] | None:
    return frame.getchannel("A").getbbox()


def shared_frame_box(cells: list[Image.Image]) -> tuple[int, int, int, int] | None:
    boxes = [box for cell in cells if (box := frame_bbox(cell)) is not None]
    if not boxes:
        return None

    left = min(box[0] for box in boxes)
    top = min(box[1] for box in boxes)
    right = max(box[2] for box in boxes)
    bottom = max(box[3] for box in boxes)
    return left, top, right, bottom


def shared_frame_scale(box: tuple[int, int, int, int] | None) -> float:
    if box is None:
        return 1.0

    max_width = box[2] - box[0]
    max_height = box[3] - box[1]
    return min(FRAME_WIDTH / max_width, 28 / max_height)


def fit_frame(frame: Image.Image, crop_box: tuple[int, int, int, int] | None, scale: float) -> tuple[Image.Image, int]:
    if crop_box is None:
        return Image.new("RGBA", (FRAME_WIDTH, 28), (0, 0, 0, 0)), 4

    cropped = frame.crop(crop_box)
    new_size = (
        min(FRAME_WIDTH, max(1, round(cropped.width * scale))),
        min(28, max(1, round(cropped.height * scale))),
    )
    resized = cropped.resize(new_size, Image.Resampling.NEAREST)
    canvas = Image.new("RGBA", (FRAME_WIDTH, 28), (0, 0, 0, 0))
    canvas.alpha_composite(resized, ((FRAME_WIDTH - resized.width) // 2, 28 - resized.height))
    return canvas, 4


def paste_mapped_frame(
    output: Image.Image,
    frame: Image.Image,
    dest_x: int,
    dest_y: int,
    palette_colors: list[tuple[int, int, int]],
    candidates: list[int],
) -> None:
    frame_rgba = frame.convert("RGBA")

    for y in range(frame.height):
        for x in range(frame.width):
            transparent = frame.getpixel((x, y)) == 0 if frame.mode == "P" else False
            r, g, b, a = frame_rgba.getpixel((x, y))
            pixel = 0 if transparent or a < 128 else nearest_index((r, g, b), palette_colors, candidates)
            output.putpixel((dest_x + x, dest_y + y), pixel)


def convert_sprite(source_path: Path, output_path: Path, reference_path: Path | None, preserve_standing: bool) -> None:
    source = Image.open(source_path).convert("RGBA")
    if source.width % 4 or source.height % 4:
        raise ValueError(f"{source_path.name}: expected a 4x4 sheet, got {source.size[0]}x{source.size[1]}")
    source_frame_width = source.width // 4
    source_frame_height = source.height // 4
    frame_map = GEN4_FRAME_MAP if source.width == source.height else SOULFULLEX_FRAME_MAP

    reference = Image.open(reference_path) if reference_path else None
    if reference and reference.size != (FRAME_WIDTH * 10, FRAME_HEIGHT):
        raise ValueError(f"{reference_path.name}: expected 160x32 reference, got {reference.size[0]}x{reference.size[1]}")

    uniform_palette = dominant_frlg_trainer_palette()
    palette, palette_colors = uniform_palette or first_16_palette(reference if reference else source)
    candidates = list(range(1, 16))
    if not candidates:
        candidates = list(range(1, 16))

    output = Image.new("P", (FRAME_WIDTH * 10, FRAME_HEIGHT), 0)
    output.putpalette(palette)

    if reference and preserve_standing:
        for index in STANDING_FRAME_INDICES:
            box = (index * FRAME_WIDTH, 0, (index + 1) * FRAME_WIDTH, FRAME_HEIGHT)
            paste_mapped_frame(
                output,
                reference.crop(box),
                index * FRAME_WIDTH,
                0,
                palette_colors,
                candidates,
            )

    cells: list[Image.Image] = []
    for row, col in frame_map:
        box = (
            col * source_frame_width,
            row * source_frame_height,
            (col + 1) * source_frame_width,
            (row + 1) * source_frame_height,
        )
        cells.append(source.crop(box))

    crop_box = shared_frame_box(cells)
    scale = shared_frame_scale(crop_box)

    for dest_index, cell in enumerate(cells):
        if reference and preserve_standing and dest_index in STANDING_FRAME_INDICES:
            continue

        frame, y_offset = fit_frame(cell, crop_box, scale)
        paste_mapped_frame(output, frame, dest_index * FRAME_WIDTH, y_offset, palette_colors, candidates)

    output.save(output_path)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--raw-dir", type=Path, default=RAW_DIR)
    parser.add_argument("--overwrite", action="store_true", help="Replace existing *_test.png outputs.")
    parser.add_argument(
        "--preserve-standing",
        action="store_true",
        help="Keep matching reference standing frames from MoreTrainers/FRLGRawTrainers when available.",
    )
    args = parser.parse_args()

    raw_dir = args.raw_dir.resolve()
    if not raw_dir.exists():
        raise FileNotFoundError(raw_dir)

    made = 0
    for source_path in sorted(raw_dir.glob("*.png")):
        stem = output_stem(source_path)
        output_path = SCRIPT_DIR / f"{stem}.png"
        if output_path.exists() and not args.overwrite:
            print(f"Skipping {output_path.name}; use --overwrite to replace it.")
            continue

        reference_path = find_reference(stem)
        convert_sprite(
            source_path,
            output_path,
            reference_path,
            preserve_standing=args.preserve_standing,
        )
        ref_note = f" using {reference_path.name}" if reference_path else ""
        print(f"Wrote {output_path.name}{ref_note}")
        made += 1

    print(f"Converted {made} sprite(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
