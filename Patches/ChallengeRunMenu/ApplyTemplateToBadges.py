#!/usr/bin/env python3
from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path

from PIL import Image


DEFAULT_INDICES = "0-1,7-12"
DEFAULT_DATA_DIR = Path(__file__).resolve().parent / "data"
DEFAULT_SOURCE_DIR = Path(__file__).resolve().parent / "unmodified"
WHITE_INDICES = range(1, 5)
##WHITE_RGB = [26*8, 28*8, 29*8]
WHITE_RGB = [31*8, 31*8, 31*8]

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

    for idx in indices:
        start = idx * 3
        target_palette[start : start + 3] = template_palette[start : start + 3]

    for idx in WHITE_INDICES:
        start = idx * 3
        target_palette[start : start + 3] = WHITE_RGB

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

                if target_px[x, y] != idx:
                    changed += 1
                target_px[x, y] = idx

    if not dry_run:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        target.save(output_path, transparency=0, optimize=False)
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
        help="Palette indices to stamp, e.g. '0-1,7-12' or '1,4,7-12'. Defaults to transparent, inner circle edge, and shared gold ring.",
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
    template_path = output_dir / args.template

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
