#!/usr/bin/env python3
"""Convert a rendered map PNG into a Tiled TMX using an existing tileset PNG.

The old scripts in this folder predate Python 3 and either build a new tileset
or require exact tile matches. This helper keeps the requested tileset and can
fall back to nearest-tile matching when the source image is not byte-identical.
"""

from __future__ import annotations

import argparse
import math
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

from PIL import Image


@dataclass(frozen=True)
class TileMatch:
    gid: int
    error: int
    exact: bool


def iter_boxes(width: int, height: int, tile_width: int, tile_height: int) -> Iterable[tuple[int, int, int, int]]:
    for y in range(0, height, tile_height):
        for x in range(0, width, tile_width):
            yield x, y, x + tile_width, y + tile_height


def tile_error(left: bytes, right: bytes) -> int:
    return sum((a - b) * (a - b) for a, b in zip(left, right))


def read_tiles(image_path: Path, tile_width: int, tile_height: int) -> tuple[list[bytes], dict[bytes, int], int, int]:
    image = Image.open(image_path).convert("RGB")
    width, height = image.size
    if width % tile_width or height % tile_height:
        raise ValueError(f"{image_path} is not evenly divisible by {tile_width}x{tile_height} tiles")

    tiles: list[bytes] = []
    exact: dict[bytes, int] = {}
    columns = width // tile_width
    for gid, box in enumerate(iter_boxes(width, height, tile_width, tile_height), start=1):
        data = image.crop(box).tobytes()
        tiles.append(data)
        exact.setdefault(data, gid)

    return tiles, exact, columns, width * height // (tile_width * tile_height)


def find_match(tile: bytes, tileset_tiles: list[bytes], exact_tiles: dict[bytes, int]) -> TileMatch:
    exact_gid = exact_tiles.get(tile)
    if exact_gid is not None:
        return TileMatch(exact_gid, 0, True)

    best_gid = 1
    best_error = math.inf
    for index, candidate in enumerate(tileset_tiles, start=1):
        error = tile_error(tile, candidate)
        if error < best_error:
            best_gid = index
            best_error = error
    return TileMatch(best_gid, int(best_error), False)


def build_tmx(
    map_width: int,
    map_height: int,
    tile_width: int,
    tile_height: int,
    tileset_path: Path,
    tileset_name: str,
    tilecount: int,
    columns: int,
    gids: list[int],
) -> ET.ElementTree:
    root = ET.Element(
        "map",
        {
            "version": "1.5",
            "tiledversion": "1.7.2",
            "orientation": "orthogonal",
            "renderorder": "right-down",
            "width": str(map_width),
            "height": str(map_height),
            "tilewidth": str(tile_width),
            "tileheight": str(tile_height),
            "infinite": "0",
            "nextlayerid": "2",
            "nextobjectid": "1",
        },
    )
    tileset = ET.SubElement(
        root,
        "tileset",
        {
            "firstgid": "1",
            "name": tileset_name,
            "tilewidth": str(tile_width),
            "tileheight": str(tile_height),
            "tilecount": str(tilecount),
            "columns": str(columns),
        },
    )
    image = Image.open(tileset_path)
    ET.SubElement(
        tileset,
        "image",
        {
            "source": tileset_path.name,
            "trans": "ffffff",
            "width": str(image.width),
            "height": str(image.height),
        },
    )
    layer = ET.SubElement(
        root,
        "layer",
        {
            "id": "1",
            "name": "Tile Layer 1",
            "width": str(map_width),
            "height": str(map_height),
        },
    )
    data = ET.SubElement(layer, "data")
    for gid in gids:
        ET.SubElement(data, "tile", {"gid": str(gid)})
    return ET.ElementTree(root)


def write_preview(
    output_path: Path,
    gids: list[int],
    tileset_path: Path,
    map_width: int,
    map_height: int,
    tile_width: int,
    tile_height: int,
    tileset_columns: int,
) -> None:
    tileset = Image.open(tileset_path).convert("RGB")
    preview = Image.new("RGB", (map_width * tile_width, map_height * tile_height))
    for index, gid in enumerate(gids):
        source_index = gid - 1
        sx = (source_index % tileset_columns) * tile_width
        sy = (source_index // tileset_columns) * tile_height
        dx = (index % map_width) * tile_width
        dy = (index // map_width) * tile_height
        preview.paste(tileset.crop((sx, sy, sx + tile_width, sy + tile_height)), (dx, dy))
    preview.save(output_path)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("map_image", type=Path)
    parser.add_argument("tileset_image", type=Path)
    parser.add_argument("-o", "--output", type=Path)
    parser.add_argument("--preview", type=Path)
    parser.add_argument("--tile-width", type=int, default=16)
    parser.add_argument("--tile-height", type=int, default=16)
    parser.add_argument("--tileset-name")
    args = parser.parse_args()

    map_image = Image.open(args.map_image).convert("RGB")
    if map_image.width % args.tile_width or map_image.height % args.tile_height:
        raise ValueError(f"{args.map_image} is not evenly divisible by {args.tile_width}x{args.tile_height} tiles")

    tileset_tiles, exact_tiles, columns, tilecount = read_tiles(args.tileset_image, args.tile_width, args.tile_height)

    gids: list[int] = []
    match_cache: dict[bytes, TileMatch] = {}
    exact_count = 0
    errors: list[int] = []
    for box in iter_boxes(map_image.width, map_image.height, args.tile_width, args.tile_height):
        tile = map_image.crop(box).tobytes()
        match = match_cache.get(tile)
        if match is None:
            match = find_match(tile, tileset_tiles, exact_tiles)
            match_cache[tile] = match
        gids.append(match.gid)
        exact_count += int(match.exact)
        if not match.exact:
            errors.append(match.error)

    map_width = map_image.width // args.tile_width
    map_height = map_image.height // args.tile_height
    output = args.output or args.map_image.with_suffix(".tmx")
    tileset_name = args.tileset_name or args.tileset_image.stem
    tree = build_tmx(
        map_width,
        map_height,
        args.tile_width,
        args.tile_height,
        args.tileset_image,
        tileset_name,
        tilecount,
        columns,
        gids,
    )
    ET.indent(tree, space=" ")
    tree.write(output, encoding="UTF-8", xml_declaration=True)

    if args.preview:
        write_preview(args.preview, gids, args.tileset_image, map_width, map_height, args.tile_width, args.tile_height, columns)

    print(f"Wrote {output}")
    print(f"Map size: {map_width}x{map_height} tiles")
    print(f"Unique source tiles: {len(match_cache)}")
    print(f"Exact matches: {exact_count}/{len(gids)}")
    if errors:
        print(f"Nearest matches: {len(errors)} tiles")
        print(f"Average nearest error: {sum(errors) // len(errors)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
