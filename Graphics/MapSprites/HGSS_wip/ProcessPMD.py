#!/usr/bin/env python3
"""Build SMS_PMD/MMS_PMD strips from Pokemon Mystery Dungeon Walk sprites."""

from __future__ import annotations

import argparse
import re
import xml.etree.ElementTree as ET
from collections import Counter
from functools import lru_cache
from pathlib import Path

from PIL import Image


SCRIPT_DIR = Path(__file__).resolve().parent
PMD_DIR = SCRIPT_DIR / "PMD"
DEFAULT_SMS_DIR = SCRIPT_DIR / "SMS_PMD"
DEFAULT_MMS_DIR = SCRIPT_DIR / "MMS_PMD"
DEFAULT_PALETTE_SOURCE = SCRIPT_DIR / "BlankSMS.png"
DEFAULT_ARTIST_SMS_DIR = SCRIPT_DIR / "SMS_handdonePMD"

TARGET_FRAME_SIZE = 32
SMS_SIZE = (32, 96)
MMS_SIZE = (32, 480)
BACKGROUND = (128, 160, 128)
ARTIST_ALIGNMENT_RADIUS = 4
MIN_ARTIST_COLOR_SAMPLES = 6
MIN_ARTIST_COLOR_SHARE = 0.30
AMBIGUOUS_ARTIST_COLOR_SHARE = 0.20
AMBIGUOUS_SCORE_RATIO = 0.85

POKEMON_WALK_SHEET_OVERRIDES = {
    95: Path("0000") / "0001" / "Walk-Anim.png",   # Onix
    144: Path("0000") / "0001" / "Walk-Anim.png",  # Articuno
}

POKEMON_HEIGHT_FIT_OVERRIDES = {
    95: 30,   # Onix
    144: 30,  # Articuno
    146: 30,  # Moltres
}

POKEMON_SIDE_FACE_ANCHORS = {
    95: "left",   # Onix
    144: "left",  # Articuno
}

FULL_WALK_POKEMON = frozenset({
    36,   # Clefable
    43,   # Oddish
    48,   # Venonat
    56,   # Mankey
    60,   # Poliwag
    86,   # Seel
    93,   # Haunter
    100,  # Voltorb
    101,  # Electrode
    114,  # Tangela
    141,  # Kabutops
    148,  # Dragonair
})

OFFSET_BOTTOM_MMS_POKEMON = frozenset({
    36,   # Clefable: use MMS frames 6, 7, 8
    43,   # Oddish: use MMS frames 6, 7, 8
    141,  # Kabutops: use MMS frames 6, 7, 8
})

STABLE_BOTTOM_MMS_POKEMON = frozenset({
    41,   # Zubat
    48,   # Venonat
    56,   # Mankey
    60,   # Poliwag
    100,  # Voltorb
})

POKEMON_COLOR_OVERRIDES = {
    118: {  # Goldeen: preserve the artist's orange, pink, and cool-gray regions.
        (143, 223, 255): 8,
        (255, 135, 95): 7,
        (255, 135, 191): 5,
        (215, 63, 0): 3,
        (31, 159, 231): 10,
        (159, 0, 0): 13,
    },
}

SMS_FRAME_CELLS = ((7, 3), (7, 0), (7, 1))
MMS_WALK_CELLS = (
    (6, 1), (6, 2), (6, 3), (6, 2),  # side
    (0, 1), (0, 2), (0, 3), (0, 2),  # down
    (4, 1), (4, 2), (4, 3), (4, 2),  # up
)
SHORT_SMS_FRAME_CELLS = ((7, 2), (7, 0), (7, 1))
SHORT_MMS_WALK_CELLS = (
    (6, 0), (6, 1), (6, 2), (6, 1),  # side
    (0, 0), (0, 1), (0, 2), (0, 1),  # down
    (4, 0), (4, 1), (4, 2), (4, 1),  # up
)

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


def find_walk_sheet(folder: Path, number: int) -> Path | None:
    override = POKEMON_WALK_SHEET_OVERRIDES.get(number)
    if override is not None:
        path = folder / override
        if path.exists():
            return path

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


def animation_metadata(
    animation_sheet: Path,
    animation_name: str,
) -> tuple[int, int, tuple[int, ...]] | None:
    metadata_path = animation_sheet.with_name("AnimData.xml")
    if not metadata_path.exists():
        return None

    root = ET.parse(metadata_path).getroot()
    animation = next(
        (anim for anim in root.findall(".//Anim") if anim.findtext("Name") == animation_name),
        None,
    )
    if animation is None:
        return None
    frame_width = int(animation.findtext("FrameWidth", "0"))
    frame_height = int(animation.findtext("FrameHeight", "0"))
    durations = tuple(int(node.text) for node in animation.findall("./Durations/Duration") if node.text)
    if frame_width <= 0 or frame_height <= 0 or not durations:
        return None
    return frame_width, frame_height, durations


def walk_durations(walk_sheet: Path) -> tuple[int, ...]:
    metadata = animation_metadata(walk_sheet, "Walk")
    return metadata[2] if metadata is not None else ()


def sample_walk_columns(durations: tuple[int, ...]) -> tuple[int, int, int, int]:
    if len(durations) < 4 or any(duration <= 0 for duration in durations):
        raise ValueError("a full walk cycle needs at least four positive frame durations")

    total_duration = sum(durations)
    samples = []
    for phase in range(4):
        target = (phase + 0.5) * total_duration / 4
        elapsed = 0
        for column, duration in enumerate(durations):
            elapsed += duration
            if target < elapsed:
                samples.append(column)
                break
        else:
            samples.append(len(durations) - 1)
    return samples[0], samples[1], samples[2], samples[3]


def idle_fallback_cells(columns: int) -> tuple[tuple[int, int], ...]:
    return tuple((0, min(column, columns - 1)) for column in range(3))


def full_walk_cells(
    sampled_columns: tuple[int, int, int, int],
    columns: int,
) -> tuple[tuple[int, int], ...]:
    return (
        *((6, column) for column in sampled_columns),  # side
        *((0, column) for column in sampled_columns),  # down
        *((4, column) for column in sampled_columns),  # up
        *idle_fallback_cells(columns),
    )


def frame_cells(
    number: int,
    columns: int,
    durations: tuple[int, ...] = (),
) -> tuple[tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]:
    if number in FULL_WALK_POKEMON:
        if len(durations) != columns:
            raise ValueError(f"walk metadata describes {len(durations)} columns, but the sheet has {columns}")
        return SMS_FRAME_CELLS, full_walk_cells(sample_walk_columns(durations), columns)
    if columns == 3:
        return SHORT_SMS_FRAME_CELLS, SHORT_MMS_WALK_CELLS + idle_fallback_cells(columns)
    return SMS_FRAME_CELLS, MMS_WALK_CELLS + idle_fallback_cells(columns)


def horizontal_anchor(number: int, row: int) -> str | None:
    if row in (6, 7):
        return POKEMON_SIDE_FACE_ANCHORS.get(number)
    return None


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


def quantize_to_palette(
    image: Image.Image,
    palette: list[int],
    color_overrides: dict[tuple[int, int, int], int] | None = None,
) -> Image.Image:
    colors_key = tuple(palette_colors(palette))
    color_overrides = color_overrides or {}

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
        0 if alpha < 128 else color_overrides.get(color, nearest_palette_index(color, colors_key))
        for color, alpha in zip(rgb.getdata(), rgba.getchannel("A").getdata())
    ])
    return indexed


def transparent_mask(frame: Image.Image) -> Image.Image:
    if frame.mode == "P":
        return frame.point(lambda pixel: 0 if pixel == 0 else 255, "L")
    return frame.convert("RGBA").getchannel("A")


def fit_frame(
    frame: Image.Image,
    palette: list[int],
    target_height: int | None = None,
    horizontal_anchor: str | None = None,
) -> Image.Image:
    mask = transparent_mask(frame)
    bbox = mask.getbbox()
    output = Image.new("P", (TARGET_FRAME_SIZE, TARGET_FRAME_SIZE), 0)
    output.putpalette(palette)

    if bbox is None:
        return output

    cropped = frame.crop(bbox)
    cropped_mask = mask.crop(bbox)
    if target_height is not None:
        scale = target_height / cropped.height
        size = (
            max(1, round(cropped.width * scale)),
            max(1, round(cropped.height * scale)),
        )
        cropped = cropped.resize(size, Image.Resampling.NEAREST)
        cropped_mask = cropped_mask.resize(size, Image.Resampling.NEAREST)
    elif cropped.width > TARGET_FRAME_SIZE or cropped.height > TARGET_FRAME_SIZE:
        scale = min(TARGET_FRAME_SIZE / cropped.width, TARGET_FRAME_SIZE / cropped.height)
        size = (
            max(1, round(cropped.width * scale)),
            max(1, round(cropped.height * scale)),
        )
        cropped = cropped.resize(size, Image.Resampling.NEAREST)
        cropped_mask = cropped_mask.resize(size, Image.Resampling.NEAREST)

    if horizontal_anchor == "left" and cropped.width > TARGET_FRAME_SIZE:
        x = 0
    elif horizontal_anchor == "right" and cropped.width > TARGET_FRAME_SIZE:
        x = TARGET_FRAME_SIZE - cropped.width
    else:
        x = (TARGET_FRAME_SIZE - cropped.width) // 2
    y = TARGET_FRAME_SIZE - cropped.height
    output.paste(cropped, (x, y), cropped_mask)
    return output


def fit_frame_group(frames: list[Image.Image], palette: list[int]) -> list[Image.Image]:
    masks = [transparent_mask(frame) for frame in frames]
    boxes = [bbox for mask in masks if (bbox := mask.getbbox()) is not None]
    if not boxes:
        return [fit_frame(frame, palette) for frame in frames]

    common_box = (
        min(box[0] for box in boxes),
        min(box[1] for box in boxes),
        max(box[2] for box in boxes),
        max(box[3] for box in boxes),
    )
    common_width = common_box[2] - common_box[0]
    common_height = common_box[3] - common_box[1]
    scale = min(1.0, TARGET_FRAME_SIZE / common_width, TARGET_FRAME_SIZE / common_height)
    fitted_size = (
        max(1, round(common_width * scale)),
        max(1, round(common_height * scale)),
    )
    position = (
        (TARGET_FRAME_SIZE - fitted_size[0]) // 2,
        TARGET_FRAME_SIZE - fitted_size[1],
    )

    outputs = []
    for frame, mask in zip(frames, masks):
        cropped = frame.crop(common_box)
        cropped_mask = mask.crop(common_box)
        if fitted_size != cropped.size:
            cropped = cropped.resize(fitted_size, Image.Resampling.NEAREST)
            cropped_mask = cropped_mask.resize(fitted_size, Image.Resampling.NEAREST)

        output = Image.new("P", (TARGET_FRAME_SIZE, TARGET_FRAME_SIZE), 0)
        output.putpalette(palette)
        output.paste(cropped, position, cropped_mask)
        outputs.append(output)
    return outputs


def fit_rgba_frame(frame: Image.Image) -> Image.Image:
    rgba = frame.convert("RGBA")
    mask = rgba.getchannel("A")
    bbox = mask.getbbox()
    output = Image.new("RGBA", (TARGET_FRAME_SIZE, TARGET_FRAME_SIZE), (0, 0, 0, 0))

    if bbox is None:
        return output

    cropped = rgba.crop(bbox)
    if cropped.width > TARGET_FRAME_SIZE or cropped.height > TARGET_FRAME_SIZE:
        scale = min(TARGET_FRAME_SIZE / cropped.width, TARGET_FRAME_SIZE / cropped.height)
        size = (
            max(1, round(cropped.width * scale)),
            max(1, round(cropped.height * scale)),
        )
        cropped = cropped.resize(size, Image.Resampling.NEAREST)

    x = (TARGET_FRAME_SIZE - cropped.width) // 2
    y = TARGET_FRAME_SIZE - cropped.height
    output.alpha_composite(cropped, (x, y))
    return output


def best_mask_alignment(source: Image.Image, reference: Image.Image) -> tuple[int, int]:
    source_mask = source.getchannel("A")
    reference_mask = transparent_mask(reference)
    source_pixels = {
        (x, y)
        for y in range(TARGET_FRAME_SIZE)
        for x in range(TARGET_FRAME_SIZE)
        if source_mask.getpixel((x, y)) >= 128
    }
    reference_pixels = {
        (x, y)
        for y in range(TARGET_FRAME_SIZE)
        for x in range(TARGET_FRAME_SIZE)
        if reference_mask.getpixel((x, y)) >= 128
    }

    best_key: tuple[float, int, int, int, int] | None = None
    best_shift = (0, 0)
    for dy in range(-ARTIST_ALIGNMENT_RADIUS, ARTIST_ALIGNMENT_RADIUS + 1):
        for dx in range(-ARTIST_ALIGNMENT_RADIUS, ARTIST_ALIGNMENT_RADIUS + 1):
            shifted = {
                (x + dx, y + dy)
                for x, y in source_pixels
                if 0 <= x + dx < TARGET_FRAME_SIZE and 0 <= y + dy < TARGET_FRAME_SIZE
            }
            overlap = len(shifted & reference_pixels)
            union = len(shifted | reference_pixels)
            score = overlap / union if union else 0.0
            key = (score, overlap, -(abs(dx) + abs(dy)), -abs(dy), -abs(dx))
            if best_key is None or key > best_key:
                best_key = key
                best_shift = (dx, dy)
    return best_shift


def is_interior(mask: Image.Image, x: int, y: int) -> bool:
    if x == 0 or y == 0 or x == TARGET_FRAME_SIZE - 1 or y == TARGET_FRAME_SIZE - 1:
        return False
    return all(
        mask.getpixel((x + dx, y + dy)) >= 128
        for dx, dy in ((0, 0), (-1, 0), (1, 0), (0, -1), (0, 1))
    )


def artist_target_allowed(source_color: tuple[int, int, int], target_index: int, nearest_index: int) -> bool:
    if not 1 <= target_index < 16:
        return False
    if target_index == 9 and nearest_index != 9:
        return False
    if target_index == 15 and max(source_color) < 224:
        return False
    return True


def artist_color_overrides(
    sheet: Image.Image,
    sms_cells: tuple[tuple[int, int], ...],
    frame_width: int,
    frame_height: int,
    artist_path: Path,
    palette: list[int],
) -> dict[tuple[int, int, int], int]:
    if not artist_path.exists():
        return {}

    artist = Image.open(artist_path)
    if artist.mode != "P":
        raise ValueError(f"{artist_path}: artist reference must be paletted; got mode {artist.mode}")
    if artist.size != SMS_SIZE:
        raise ValueError(f"{artist_path}: artist reference must be {SMS_SIZE[0]}x{SMS_SIZE[1]}; got {artist.size[0]}x{artist.size[1]}")
    used_indexes = set(artist.getdata())
    if any(index >= 16 for index in used_indexes):
        raise ValueError(f"{artist_path}: artist reference uses a palette index above 15")

    scores: dict[tuple[int, int, int], dict[int, int]] = {}
    source_counts: Counter[tuple[int, int, int]] = Counter()
    artist_counts: Counter[int] = Counter()
    for frame_index, (row, column) in enumerate(sms_cells):
        box = (
            column * frame_width,
            row * frame_height,
            (column + 1) * frame_width,
            (row + 1) * frame_height,
        )
        source = fit_rgba_frame(sheet.crop(box))
        reference = artist.crop((0, frame_index * TARGET_FRAME_SIZE, TARGET_FRAME_SIZE, (frame_index + 1) * TARGET_FRAME_SIZE))
        dx, dy = best_mask_alignment(source, reference)
        source_mask = source.getchannel("A")
        reference_mask = transparent_mask(reference)
        source_counts.update(pixel[:3] for pixel in source.getdata() if pixel[3] >= 128)
        artist_counts.update(pixel for pixel in reference.getdata() if pixel != 0)

        for y in range(TARGET_FRAME_SIZE):
            for x in range(TARGET_FRAME_SIZE):
                if source_mask.getpixel((x, y)) < 128:
                    continue
                reference_x = x + dx
                reference_y = y + dy
                if not (0 <= reference_x < TARGET_FRAME_SIZE and 0 <= reference_y < TARGET_FRAME_SIZE):
                    continue
                target_index = reference.getpixel((reference_x, reference_y))
                if target_index == 0:
                    continue

                source_color = source.getpixel((x, y))[:3]
                same_region_type = is_interior(source_mask, x, y) == is_interior(reference_mask, reference_x, reference_y)
                weight = 3 if same_region_type else 1
                color_scores = scores.setdefault(source_color, {})
                color_scores[target_index] = color_scores.get(target_index, 0) + weight

    colors_key = tuple(palette_colors(palette))
    assignments = {
        source_color: nearest_palette_index(source_color, colors_key)
        for source_color in source_counts
    }
    matched_colors: set[tuple[int, int, int]] = set()
    ambiguous: list[tuple[tuple[int, int, int], dict[int, int]]] = []
    for source_color, target_scores in scores.items():
        nearest_index = assignments[source_color]
        if source_color in ((0, 0, 0), (255, 255, 255)):
            matched_colors.add(source_color)
            continue

        allowed_scores = {
            target_index: score
            for target_index, score in target_scores.items()
            if artist_target_allowed(source_color, target_index, nearest_index)
        }
        if not allowed_scores:
            continue
        total = sum(allowed_scores.values())
        target_index, best_score = max(
            allowed_scores.items(),
            key=lambda item: (item[1], item[0] == nearest_index),
        )
        if total >= MIN_ARTIST_COLOR_SAMPLES and best_score / total >= MIN_ARTIST_COLOR_SHARE:
            assignments[source_color] = target_index
            matched_colors.add(source_color)
        elif total >= MIN_ARTIST_COLOR_SAMPLES and best_score / total >= AMBIGUOUS_ARTIST_COLOR_SHARE:
            ambiguous.append((source_color, allowed_scores))

    source_total = sum(source_counts.values())
    artist_total = sum(artist_counts.values())
    desired_counts = {
        index: artist_counts[index] * source_total / artist_total
        for index in range(1, 16)
    }
    projected_counts: Counter[int] = Counter()
    for source_color, count in source_counts.items():
        projected_counts[assignments[source_color]] += count

    for source_color, target_scores in sorted(ambiguous, key=lambda item: source_counts[item[0]], reverse=True):
        current_index = assignments[source_color]
        source_count = source_counts[source_color]
        best_score = max(target_scores.values())
        candidates = {
            target_index
            for target_index, score in target_scores.items()
            if score >= best_score * AMBIGUOUS_SCORE_RATIO
        }
        candidates.add(current_index)

        def histogram_error(candidate: int) -> float:
            error = 0.0
            for index in range(1, 16):
                projected = projected_counts[index]
                if candidate != current_index:
                    if index == current_index:
                        projected -= source_count
                    elif index == candidate:
                        projected += source_count
                error += abs(projected - desired_counts[index])
            return error

        chosen_index = min(
            candidates,
            key=lambda candidate: (
                histogram_error(candidate),
                candidate != current_index,
                -target_scores.get(candidate, 0),
            ),
        )
        if chosen_index != current_index:
            projected_counts[current_index] -= source_count
            projected_counts[chosen_index] += source_count
            assignments[source_color] = chosen_index
        matched_colors.add(source_color)

    return {source_color: assignments[source_color] for source_color in matched_colors}


def source_frame(
    sheet: Image.Image,
    row: int,
    column: int,
    frame_width: int,
    frame_height: int,
    palette: list[int],
    target_height: int | None = None,
    horizontal_anchor: str | None = None,
) -> Image.Image:
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
    return fit_frame(sheet.crop(box), palette, target_height, horizontal_anchor)


def source_frame_group(
    sheet: Image.Image,
    cells: tuple[tuple[int, int], ...],
    frame_width: int,
    frame_height: int,
    palette: list[int],
) -> list[Image.Image]:
    rows = sheet.height // frame_height
    columns = sheet.width // frame_width
    frames = []
    for row, column in cells:
        if row >= rows or column >= columns:
            raise ValueError(f"cell ({row}, {column}) is outside a {columns}x{rows} sheet")
        frames.append(sheet.crop((
            column * frame_width,
            row * frame_height,
            (column + 1) * frame_width,
            (row + 1) * frame_height,
        )))
    return fit_frame_group(frames, palette)


def frame_signature(frame: Image.Image) -> bytes:
    return bytes(frame.getdata())


def mask_overlap(first: Image.Image, second: Image.Image) -> float:
    first_pixels = {index for index, pixel in enumerate(first.getdata()) if pixel != 0}
    second_pixels = {index for index, pixel in enumerate(second.getdata()) if pixel != 0}
    union = len(first_pixels | second_pixels)
    return len(first_pixels & second_pixels) / union if union else 1.0


def align_frame_baselines(frames: list[Image.Image], palette: list[int]) -> list[Image.Image]:
    boxes = [transparent_mask(frame).getbbox() for frame in frames]
    target_bottom = max(box[3] for box in boxes if box is not None)
    aligned = []
    for frame, box in zip(frames, boxes):
        if box is None or box[3] == target_bottom:
            aligned.append(frame)
            continue
        output = Image.new("P", (TARGET_FRAME_SIZE, TARGET_FRAME_SIZE), 0)
        output.putpalette(palette)
        output.paste(frame, (0, target_bottom - box[3]))
        aligned.append(output)
    return aligned


def stable_distinct_idle_frames(
    idle_frames: list[Image.Image],
    walk_frames: list[Image.Image],
    palette: list[int],
) -> list[Image.Image]:
    neutral = idle_frames[0]
    seen = {frame_signature(neutral)}
    candidates: list[tuple[int, int, Image.Image]] = []

    def add_candidates(frames: list[Image.Image], source_priority: int) -> None:
        for source_order, frame in enumerate(frames):
            signature = frame_signature(frame)
            if signature in seen:
                continue
            seen.add(signature)
            candidates.append((source_priority, source_order, frame))

    add_candidates(idle_frames[1:], 0)
    if len(candidates) < 2:
        add_candidates(walk_frames, 1)
    if len(candidates) < 2:
        hybrid_idle = []
        for first in idle_frames:
            for second in idle_frames:
                if first is second:
                    continue
                hybrid = first.copy()
                hybrid.paste(
                    second.crop((TARGET_FRAME_SIZE // 2, 0, TARGET_FRAME_SIZE, TARGET_FRAME_SIZE)),
                    (TARGET_FRAME_SIZE // 2, 0),
                )
                hybrid_idle.append(hybrid)
        add_candidates(hybrid_idle, 2)
    if len(candidates) < 2:
        mirrored_idle = [frame.transpose(Image.Transpose.FLIP_LEFT_RIGHT) for frame in idle_frames]
        add_candidates(mirrored_idle, 3)

    if len(candidates) < 2:
        raise ValueError("idle and down-facing walk animations contain fewer than three distinct frames")

    selected = sorted(
        candidates,
        key=lambda candidate: (
            candidate[0],
            -mask_overlap(neutral, candidate[2]),
            candidate[1],
        ),
    )[:2]
    selected.sort(key=lambda candidate: (candidate[0], candidate[1]))
    return align_frame_baselines([neutral, selected[0][2], selected[1][2]], palette)


def idle_mms_frames(
    walk_sheet: Path,
    palette: list[int],
    color_overrides: dict[tuple[int, int, int], int],
) -> list[Image.Image] | None:
    rows = 8
    walk_metadata = animation_metadata(walk_sheet, "Walk")
    if walk_metadata is None:
        return None
    walk_width, walk_height, walk_durations = walk_metadata
    walk_source = Image.open(walk_sheet).convert("RGBA")
    if walk_source.size != (walk_width * len(walk_durations), walk_height * rows):
        raise ValueError(f"{walk_sheet}: size does not match its Walk metadata")
    quantized_walk = quantize_to_palette(walk_source, palette, color_overrides)
    walk_frames = [
        source_frame(quantized_walk, 0, column, walk_width, walk_height, palette)
        for column in range(len(walk_durations))
    ]

    idle_sheet_path = walk_sheet.with_name("Idle-Anim.png")
    metadata = animation_metadata(idle_sheet_path, "Idle")
    if not idle_sheet_path.exists() or metadata is None:
        return stable_distinct_idle_frames([walk_frames[0]], walk_frames[1:], palette)

    frame_width, frame_height, durations = metadata
    source_sheet = Image.open(idle_sheet_path).convert("RGBA")
    columns = len(durations)
    if source_sheet.size != (frame_width * columns, frame_height * rows):
        raise ValueError(
            f"{idle_sheet_path}: metadata describes {columns}x{rows} "
            f"{frame_width}x{frame_height} cells, but the sheet is "
            f"{source_sheet.size[0]}x{source_sheet.size[1]}"
        )

    sheet = quantize_to_palette(source_sheet, palette, color_overrides)
    idle_frames = [
        source_frame(sheet, 0, column, frame_width, frame_height, palette)
        for column in range(columns)
    ]
    return stable_distinct_idle_frames(idle_frames, walk_frames, palette)


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


def process_folder(
    folder: Path,
    sms_dir: Path,
    mms_dir: Path,
    artist_sms_dir: Path | None,
    palette: list[int],
    overwrite: bool,
    dry_run: bool,
) -> bool:
    number = pokemon_number(folder)
    if number is None:
        return False

    walk_sheet = find_walk_sheet(folder, number)
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

    source_sheet = Image.open(walk_sheet).convert("RGBA")
    rows = 8
    columns = column_count(number, source_sheet.width)
    if source_sheet.width % columns or source_sheet.height % rows:
        raise ValueError(f"{walk_sheet}: cannot split {source_sheet.size[0]}x{source_sheet.size[1]} into {columns}x{rows} cells")

    frame_width = source_sheet.width // columns
    frame_height = source_sheet.height // rows
    durations = walk_durations(walk_sheet)
    sms_cells, mms_cells = frame_cells(number, columns, durations)
    target_height = POKEMON_HEIGHT_FIT_OVERRIDES.get(number)
    color_overrides = {}
    if artist_sms_dir is not None:
        color_overrides = artist_color_overrides(
            source_sheet,
            sms_cells,
            frame_width,
            frame_height,
            artist_sms_dir / f"{number}.png",
            palette,
        )
    color_overrides.update(POKEMON_COLOR_OVERRIDES.get(number, {}))
    sheet = quantize_to_palette(source_sheet, palette, color_overrides)
    sms_frames = [
        source_frame(sheet, row, column, frame_width, frame_height, palette, target_height, horizontal_anchor(number, row))
        for row, column in sms_cells
    ]
    if number in FULL_WALK_POKEMON:
        mms_frames = []
        for start, end in ((0, 4), (4, 8), (8, 12)):
            mms_frames.extend(source_frame_group(sheet, mms_cells[start:end], frame_width, frame_height, palette))
    else:
        mms_frames = [
            source_frame(sheet, row, column, frame_width, frame_height, palette, target_height, horizontal_anchor(number, row))
            for row, column in mms_cells[:12]
        ]
    if number in STABLE_BOTTOM_MMS_POKEMON:
        bottom_frames = idle_mms_frames(walk_sheet, palette, color_overrides)
    elif number in OFFSET_BOTTOM_MMS_POKEMON:
        bottom_frames = mms_frames[5:8]
    else:
        bottom_frames = mms_frames[4:7]
    mms_frames.extend(bottom_frames or mms_frames[4:7])

    sms_dir.mkdir(parents=True, exist_ok=True)
    mms_dir.mkdir(parents=True, exist_ok=True)
    if sms_path in output_paths:
        paste_frames(sms_frames, palette, SMS_SIZE).save(sms_path, optimize=True)
    if mms_path in output_paths:
        paste_frames(mms_frames, palette, MMS_SIZE).save(mms_path, optimize=True)
    artist_note = f" using {len(color_overrides)} artist-matched source color(s)" if color_overrides else ""
    print("Wrote " + " and ".join(path.name for path in output_paths) + artist_note)
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, default=PMD_DIR)
    parser.add_argument("--sms-dir", type=Path, default=DEFAULT_SMS_DIR)
    parser.add_argument("--mms-dir", type=Path, default=DEFAULT_MMS_DIR)
    parser.add_argument("--palette-source", type=Path, default=DEFAULT_PALETTE_SOURCE)
    parser.add_argument("--artist-sms-dir", type=Path, default=DEFAULT_ARTIST_SMS_DIR)
    parser.add_argument("--no-artist-colors", action="store_true", help="Use nearest palette colors without hand-drawn references.")
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
    artist_sms_dir = None if args.no_artist_colors else args.artist_sms_dir.resolve()
    if artist_sms_dir is not None and not artist_sms_dir.exists():
        raise FileNotFoundError(artist_sms_dir)

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
        if process_folder(
            folder,
            args.sms_dir.resolve(),
            args.mms_dir.resolve(),
            artist_sms_dir,
            palette,
            args.overwrite,
            args.dry_run,
        ):
            processed += 1

    action = "Would write" if args.dry_run else "Wrote"
    print(f"{action} {processed} PMD sprite set(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
