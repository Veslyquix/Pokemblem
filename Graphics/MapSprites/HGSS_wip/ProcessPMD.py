#!/usr/bin/env python3
"""Build SMS_PMD/MMS_PMD strips from Pokemon Mystery Dungeon Walk sprites."""

from __future__ import annotations

import argparse
import re
from functools import lru_cache
from pathlib import Path

from PIL import Image


SCRIPT_DIR = Path(__file__).resolve().parent
PMD_DIR = SCRIPT_DIR / "PMD"
DEFAULT_SMS_DIR = SCRIPT_DIR / "SMS_PMD"
DEFAULT_MMS_DIR = SCRIPT_DIR / "MMS_PMD"
DEFAULT_PALETTE_SOURCE = SCRIPT_DIR / "BlankSMS.png"

TARGET_FRAME_SIZE = 32
SMS_SIZE = (32, 96)
MMS_SIZE = (32, 480)
BACKGROUND = (128, 160, 128)

SMS_FRAME_CELLS = ((7, 3), (7, 0), (7, 1))
MMS_FRAME_CELLS = (
    (6, 1), (6, 2), (6, 3), (6, 2),  # side
    (0, 1), (0, 2), (0, 3), (0, 2),  # down
    (4, 1), (4, 2), (4, 3), (4, 2),  # up
    (0, 3), (0, 0), (0, 1),          # hover
)
SHORT_SMS_FRAME_CELLS = ((7, 2), (7, 0), (7, 1))
SHORT_MMS_FRAME_CELLS = (
    (6, 0), (6, 1), (6, 2), (6, 1),  # side
    (0, 0), (0, 1), (0, 2), (0, 1),  # down
    (4, 0), (4, 1), (4, 2), (4, 1),  # up
    (0, 2), (0, 0), (0, 1),          # hover
)

def mms_cycle_cells(sequence: tuple[int, int, int]) -> tuple[tuple[int, int], ...]:
    first, second, third = sequence
    return (
        (6, first), (6, second), (6, third), (6, second),  # side
        (0, first), (0, second), (0, third), (0, second),  # down
        (4, first), (4, second), (4, third), (4, second),  # up
        (0, third), (0, first), (0, second),               # hover
    )


POKEMON_FRAME_OVERRIDES = {
    36: (SMS_FRAME_CELLS, mms_cycle_cells((0, 2, 4))),   # Clefable
    43: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),   # Oddish
    56: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),   # Mankey
    60: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),   # Poliwag
    93: (SMS_FRAME_CELLS, mms_cycle_cells((0, 2, 4))),   # Haunter
    100: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),  # Voltorb
    101: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),  # Electrode
    114: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),  # Tangela
    141: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),  # Kabutops
    148: (SMS_FRAME_CELLS, mms_cycle_cells((0, 1, 2))),  # Dragonair
}

WIDTH_COLUMN_OVERRIDES = {
    120: 5,
    240: 6,
    280: 7,
    336: 7,
}

POKEMON_COLUMN_OVERRIDES = {
    5: 4,    # Charmeleon
    10: 3,   # Caterpie
    12: 12,  # Butterfree
    13: 3,   # Weedle
    11: 10,  # Metapod
    35: 8,   # Clefairy
    36: 8,   # Clefable
    41: 8,   # Zubat
    42: 8,   # Golbat
    43: 8,   # Oddish
    49: 12,  # Venomoth
    50: 3,   # Diglett
    51: 3,   # Dugtrio
    56: 8,   # Mankey
    63: 8,   # Abra
    81: 6,   # Magnemite
    82: 8,   # Magneton
    93: 10,  # Haunter
    92: 12,  # Gastly
    100: 8,  # Voltorb
    117: 5,  # Seadra
    118: 8,  # Goldeen
    132: 5,  # Ditto
    141: 8,  # Kabutops
    109: 10, # Koffing
    86: 7,   # Seel
    101: 7,  # Electrode
    129: 7,  # Magikarp
    148: 7,  # Dragonair
    88: 6,   # Grimer
    90: 6,   # Shellder
    91: 6,   # Cloyster
    110: 6,  # Weezing
    114: 6,  # Tangela
    150: 6,  # Mewtwo
    14: 5,   # Kakuna
    16: 5,   # Pidgey
    21: 5,   # Spearow
    37: 5,   # Vulpix
    39: 5,   # Jigglypuff
    48: 5,   # Venonat
    60: 5,   # Poliwag
    89: 5,   # Muk
    147: 5,  # Dratini
}


def pokemon_number(folder: Path) -> int | None:
    if not re.fullmatch(r"\d+", folder.name):
        return None
    return int(folder.name)


def find_walk_sheet(folder: Path) -> Path | None:
    direct = folder / "Walk-Anim.png"
    if direct.exists():
        return direct

    candidates = sorted(
        folder.rglob("Walk-Anim.png"),
        key=lambda path: (len(path.relative_to(folder).parts), path.as_posix().lower()),
    )
    return candidates[0] if candidates else None


def column_count(number: int, width: int) -> int:
    if number in POKEMON_COLUMN_OVERRIDES:
        return POKEMON_COLUMN_OVERRIDES[number]
    if width in WIDTH_COLUMN_OVERRIDES:
        return WIDTH_COLUMN_OVERRIDES[width]
    return 4


def frame_cells(number: int, columns: int) -> tuple[tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]:
    if number in POKEMON_FRAME_OVERRIDES:
        return POKEMON_FRAME_OVERRIDES[number]
    if columns == 3:
        return SHORT_SMS_FRAME_CELLS, SHORT_MMS_FRAME_CELLS
    return SMS_FRAME_CELLS, MMS_FRAME_CELLS


def first_palette(image: Image.Image) -> list[int]:
    palette = image.getpalette()
    if not palette:
        raise ValueError("palette source must be paletted")
    palette = palette[:]
    palette.extend([0] * (768 - len(palette)))
    return palette[:768]


def palette_colors(palette: list[int]) -> list[tuple[int, int, int]]:
    return [tuple(palette[index * 3 : index * 3 + 3]) for index in range(16)]


@lru_cache(maxsize=None)
def nearest_palette_index(rgb: tuple[int, int, int], colors_key: tuple[tuple[int, int, int], ...]) -> int:
    colors = list(colors_key)
    return min(range(1, 16), key=lambda index: sum((rgb[channel] - colors[index][channel]) ** 2 for channel in range(3)))


def quantize_to_palette(image: Image.Image, palette: list[int]) -> Image.Image:
    colors_key = tuple(palette_colors(palette))

    if image.mode == "RGBA":
        rgba = image
    else:
        rgba = image.convert("RGBA")

    background = Image.new("RGBA", rgba.size, BACKGROUND + (255,))
    background.alpha_composite(rgba)
    rgb = background.convert("RGB")
    indexed = Image.new("P", rgba.size, 0)
    indexed.putpalette(palette)
    indexed.putdata([
        0 if alpha < 128 else nearest_palette_index(color, colors_key)
        for color, alpha in zip(rgb.getdata(), rgba.getchannel("A").getdata())
    ])
    return indexed


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
        scale = min(TARGET_FRAME_SIZE / cropped.width, TARGET_FRAME_SIZE / cropped.height)
        size = (
            max(1, round(cropped.width * scale)),
            max(1, round(cropped.height * scale)),
        )
        cropped = cropped.resize(size, Image.Resampling.NEAREST)
        cropped_mask = cropped_mask.resize(size, Image.Resampling.NEAREST)

    x = (TARGET_FRAME_SIZE - cropped.width) // 2
    y = TARGET_FRAME_SIZE - cropped.height
    output.paste(cropped, (x, y), cropped_mask)
    return output


def source_frame(sheet: Image.Image, row: int, column: int, frame_width: int, frame_height: int, palette: list[int]) -> Image.Image:
    rows = sheet.height // frame_height
    columns = sheet.width // frame_width
    if row >= rows or column >= columns:
        raise ValueError(f"cell ({row}, {column}) is outside a {columns}x{rows} sheet")

    box = (
        column * frame_width,
        row * frame_height,
        (column + 1) * frame_width,
        (row + 1) * frame_height,
    )
    return fit_frame(sheet.crop(box), palette)


def paste_frames(frames: list[Image.Image], palette: list[int], size: tuple[int, int]) -> Image.Image:
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


def process_folder(folder: Path, sms_dir: Path, mms_dir: Path, palette: list[int], overwrite: bool, dry_run: bool) -> bool:
    number = pokemon_number(folder)
    if number is None:
        return False

    walk_sheet = find_walk_sheet(folder)
    if walk_sheet is None:
        print(f"Skipping {folder.name}; no Walk-Anim.png found.")
        return False

    sms_path = sms_dir / f"{number}.png"
    mms_path = mms_dir / f"r{number}.png"
    output_paths = [path for path in (sms_path, mms_path) if overwrite or not path.exists()]
    if not output_paths:
        return False

    if dry_run:
        print("Would write " + " and ".join(str(display_path(path)) for path in output_paths) + f" from {display_path(walk_sheet)}")
        return True

    sheet = quantize_to_palette(Image.open(walk_sheet), palette)
    rows = 8
    columns = column_count(number, sheet.width)
    if sheet.width % columns or sheet.height % rows:
        raise ValueError(f"{walk_sheet}: cannot split {sheet.size[0]}x{sheet.size[1]} into {columns}x{rows} cells")

    frame_width = sheet.width // columns
    frame_height = sheet.height // rows
    sms_cells, mms_cells = frame_cells(number, columns)
    sms_frames = [source_frame(sheet, row, column, frame_width, frame_height, palette) for row, column in sms_cells]
    mms_frames = [source_frame(sheet, row, column, frame_width, frame_height, palette) for row, column in mms_cells]

    sms_dir.mkdir(parents=True, exist_ok=True)
    mms_dir.mkdir(parents=True, exist_ok=True)
    if sms_path in output_paths:
        paste_frames(sms_frames, palette, SMS_SIZE).save(sms_path, optimize=True)
    if mms_path in output_paths:
        paste_frames(mms_frames, palette, MMS_SIZE).save(mms_path, optimize=True)
    print("Wrote " + " and ".join(path.name for path in output_paths))
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, default=PMD_DIR)
    parser.add_argument("--sms-dir", type=Path, default=DEFAULT_SMS_DIR)
    parser.add_argument("--mms-dir", type=Path, default=DEFAULT_MMS_DIR)
    parser.add_argument("--palette-source", type=Path, default=DEFAULT_PALETTE_SOURCE)
    parser.add_argument("--start", type=int, default=1)
    parser.add_argument("--count", type=int, default=151)
    parser.add_argument("--only", help="Comma-separated Pokemon numbers to process.")
    parser.add_argument("--overwrite", action="store_true", help="Replace existing SMS_PMD/MMS_PMD outputs.")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be written without changing files.")
    args = parser.parse_args()

    source_dir = args.source_dir.resolve()
    if not source_dir.exists():
        raise FileNotFoundError(source_dir)

    palette_source = Image.open(args.palette_source.resolve())
    if palette_source.mode != "P":
        raise ValueError(f"{args.palette_source.name} must be paletted; got mode {palette_source.mode}")
    palette = first_palette(palette_source)

    folders = sorted(
        (path for path in source_dir.iterdir() if path.is_dir() and pokemon_number(path) is not None),
        key=lambda path: pokemon_number(path) or 0,
    )
    end = args.start + args.count - 1
    folders = [folder for folder in folders if args.start <= (pokemon_number(folder) or 0) <= end]
    if args.only:
        selected = {int(value.strip()) for value in args.only.split(",") if value.strip()}
        folders = [folder for folder in folders if (pokemon_number(folder) or 0) in selected]

    processed = 0
    for folder in folders:
        if process_folder(folder, args.sms_dir.resolve(), args.mms_dir.resolve(), palette, args.overwrite, args.dry_run):
            processed += 1

    action = "Would write" if args.dry_run else "Wrote"
    print(f"{action} {processed} PMD sprite set(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
