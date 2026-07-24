#!/usr/bin/env python3
from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path

from PIL import Image


DEFAULT_INDICES = "0-2,7-12"
DEFAULT_DATA_DIR = Path(__file__).resolve().parent / "data"
DEFAULT_SOURCE_DIR = Path(__file__).resolve().parent / "unmodified"
BACKGROUND_INDICES = (1, 2)
SOURCE_BACKGROUND_CANDIDATE_INDICES = range(1, 7)

def parse_indices(text: str) -> set[int]:
    indices: set[int] = set()

    for part in text.split(","):
        part = part.strip()
        if not part:
            continue

        if "-" in part:
            start, end = part.split("-", 1)
            indices.update(range(int(start), int(end) + 1))
        else:
            indices.add(int(part))

    invalid = [idx for idx in indices if idx < 0 or idx > 15]
    if invalid:
        raise ValueError(f"palette indices must be from 0-15, got: {invalid}")

    return indices


def trim_png_palette(path: Path, colors: int = 16) -> None:
    data = path.read_bytes()
    out = bytearray(data[:8])
    pos = 8

    while pos < len(data):
        length = struct.unpack(">I", data[pos : pos + 4])[0]
        chunk_type = data[pos + 4 : pos + 8]
        chunk = data[pos + 8 : pos + 8 + length]
        pos += 12 + length

        if chunk_type == b"PLTE":
            chunk = chunk[: colors * 3]
        elif chunk_type == b"tRNS":
            chunk = b"\x00"

        out += struct.pack(">I", len(chunk))
        out += chunk_type
        out += chunk
        out += struct.pack(">I", zlib.crc32(chunk_type + chunk) & 0xFFFFFFFF)

    path.write_bytes(out)


def png_targets(source_dir: Path, template_name: str) -> list[Path]:
    return sorted(
        path
        for path in source_dir.glob("*.png")
        if path.name.lower() != template_name.lower() and not path.name.startswith("_")
    )


def palette_rgb(palette: list[int], idx: int) -> tuple[int, int, int]:
    start = idx * 3
    return tuple(palette[start : start + 3])


def set_palette_rgb(palette: list[int], idx: int, rgb: tuple[int, int, int]) -> None:
    start = idx * 3
    palette[start : start + 3] = list(rgb)


def is_inner_background_color(rgb: tuple[int, int, int]) -> bool:
    return min(rgb) >= 200 and (max(rgb) - min(rgb)) <= 70


def nearest_background_index(rgb: tuple[int, int, int], template_palette: list[int]) -> int:
    best_idx = BACKGROUND_INDICES[0]
    best_dist = 1 << 30

    for idx in BACKGROUND_INDICES:
        pal_rgb = palette_rgb(template_palette, idx)
        dist = sum((rgb[i] - pal_rgb[i]) * (rgb[i] - pal_rgb[i]) for i in range(3))

        if dist < best_dist:
            best_idx = idx
            best_dist = dist

    return best_idx


def normalize_inner_background_indices(
    target: Image.Image, target_palette: list[int], template_palette: list[int]
) -> int:
    target_px = target.load()
    width, height = target.size
    remap: dict[int, int] = {}
    changed = 0

    for idx in SOURCE_BACKGROUND_CANDIDATE_INDICES:
        rgb = palette_rgb(target_palette, idx)

        if is_inner_background_color(rgb):
            remap[idx] = nearest_background_index(rgb, template_palette)

    for idx in BACKGROUND_INDICES:
        set_palette_rgb(target_palette, idx, palette_rgb(template_palette, idx))

    for y in range(height):
        for x in range(width):
            idx = target_px[x, y]

            if idx in remap and idx != remap[idx]:
                target_px[x, y] = remap[idx]
                changed += 1

    return changed


def apply_template(template: Image.Image, source_path: Path, output_path: Path, indices: set[int], dry_run: bool) -> int:
    target = Image.open(source_path)

    if template.mode != "P":
        raise ValueError(f"{template.filename} must be an indexed PNG")

    if target.mode != "P":
        raise ValueError(f"{source_path} must be an indexed PNG")

    if target.size != template.size:
        raise ValueError(f"{source_path} is {target.size}, expected {template.size}")

    template_px = template.load()
    target_px = target.load()
    width, height = template.size
    template_bbox = template.getbbox()
    changed = 0

    target_palette = target.getpalette()[: 16 * 3]
    template_palette = template.getpalette()[: 16 * 3]
    changed += normalize_inner_background_indices(target, target_palette, template_palette)

    for idx in indices:
        start = idx * 3
        target_palette[start : start + 3] = template_palette[start : start + 3]

    target.putpalette(target_palette + [0, 0, 0] * (256 - 16))

    for y in range(height):
        for x in range(width):
            idx = template_px[x, y]

            if idx in indices:
                if idx == 0 and (
                    template_bbox is None
                    or x < template_bbox[0]
                    or y < template_bbox[1]
                    or x >= template_bbox[2]
                    or y >= template_bbox[3]
                ):
                    continue

                if idx in BACKGROUND_INDICES and target_px[x, y] not in BACKGROUND_INDICES and target_px[x, y] != 0:
                    continue

                if target_px[x, y] != idx:
                    changed += 1
                target_px[x, y] = idx

    if not dry_run:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        target.save(output_path, transparency=0, optimize=False, bits=4)
        trim_png_palette(output_path)

    return changed


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Stamp selected palette indices from data/template.png "
            "onto the badge PNGs from unmodified and save them into data."
        )
    )
    parser.add_argument("--source-dir", type=Path, default=DEFAULT_SOURCE_DIR)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_DATA_DIR)
    parser.add_argument("--template", default="template.png")
    parser.add_argument(
        "--indices",
        default=DEFAULT_INDICES,
        help="Palette indices to stamp, e.g. '0-2,7-12' or '1,4,7-12'. Defaults to transparent, inner circle whites, and shared gold ring.",
    )
    parser.add_argument(
        "--all-indices",
        action="store_true",
        help="Stamp every template palette index, 0-15. Index 0 still only applies inside the template bounds.",
    )
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    source_dir = args.source_dir.resolve()
    output_dir = args.output_dir.resolve()
    template_path = args.template

    if args.all_indices:
        indices = set(range(0, 16))
    else:
        indices = parse_indices(args.indices)

    template = Image.open(template_path)
    targets = png_targets(source_dir, args.template)

    if not targets:
        raise SystemExit(f"No target PNGs found in {source_dir}")

    print(f"Template: {template_path}")
    print(f"Source: {source_dir}")
    print(f"Output: {output_dir}")
    print(f"Indices: {sorted(indices)}")

    for source in targets:
        output = output_dir / source.name
        changed = apply_template(template, source, output, indices, args.dry_run)
        action = "would update" if args.dry_run else "updated"
        print(f"{action}: {output.name} from {source.name} ({changed} pixels)")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
