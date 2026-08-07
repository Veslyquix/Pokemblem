#!/usr/bin/env python3
"""Find English text entries missing from language overlays.

This compares the English Text/text_buildfile.txt tree against a language
text_buildfile.txt tree and writes English fallback blocks to untranslated.txt.
Entries are matched by label when a label is present, otherwise by numeric ID.
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LANGUAGE_ROOT = Path(__file__).resolve().parent
ENGLISH_ROOT = ROOT / "Text"

DEFAULT_LANGUAGES = ("Chinese", "Spanish")

INCLUDE_RE = re.compile(r'^\s*#include\s+"([^"]+)"')
DEFINE_RE = re.compile(r"^#define\s+([A-Za-z_][A-Za-z0-9_]*)\s+\$([0-9A-Fa-f]+)\s*$")
HASH_ENTRY_RE = re.compile(r"^\s*#\s+(?:0x|\$)?([0-9A-Fa-f]+)\b(?:\s+([A-Za-z_][A-Za-z0-9_]*))?")
LABEL_ENTRY_RE = re.compile(r"^\s*##\s+([A-Za-z_][A-Za-z0-9_]*)\b")

# Entries intentionally left untranslated. These were taken from labels that were
# commented out in Language/Chinese/untranslated.txt.
EXCEPTION_TEXT_LABELS = frozenset(
    {
        "AkimName",
        "AName",
        "AriadnaName",
        "BoomName",
        "bpatName",
        "CheeseName",
        "ChilanName",
        "DarkName",
        "DerName",
        "DislikesDesc",
        "FabulaName",
        "FpkforName",
        "GameSeedDesc3",
        "GastonName",
        "GM_Test",
        "HiroName",
        "JesterName",
        "LexykName",
        "LightScreenDesc",
        "LuisName",
        "MitchellName",
        "MoreTextHere",
        "N426Name",
        "OmarName",
        "PandanName",
        "PerfectionistAccDescText",
        "PerfectionistAccNameText",
        "PikuName",
        "ReflectDesc",
        "ScubName",
        "SD_Absorb",
        "SD_Axebreaker",
        "SD_Axefaire",
        "SD_Bowbreaker",
        "SD_Bowfaire",
        "SD_DancingBlade",
        "SD_Drain",
        "SD_DriveLck",
        "SD_DriveSkl",
        "SD_EarthBoost",
        "SD_FireBoost",
        "SD_Lancebreaker",
        "SD_Lancefaire",
        "SD_MultiHit",
        "SD_Swordbreaker",
        "SD_Swordfaire",
        "SD_Tomebreaker",
        "SD_Tomefaire",
        "SD_TripleHit",
        "SD_WaterBoost",
        "SD_WindBoost",
        "SealDefAccNameText",
        "SealLukAccNameText",
        "SealMagAccNameText",
        "SealResAccNameText",
        "SealSklAccNameText",
        "SealSpdAccNameText",
        "SealStrAccNameText",
        "SetNameTest",
        "SN_Absorb",
        "SN_Axebreaker",
        "SN_Axefaire",
        "SN_Bowbreaker",
        "SN_Bowfaire",
        "SN_Drain",
        "SN_DriveLck",
        "SN_DriveSkl",
        "SN_Lancebreaker",
        "SN_Lancefaire",
        "SN_MultiHit",
        "SN_SealLuk",
        "SN_Swordbreaker",
        "SN_Swordfaire",
        "SN_Tomebreaker",
        "SN_Tomefaire",
        "SN_TripleHit",
        "SS_LearnNewSpell",
        "StaffTypeText",
        "TeleportDesc",
        "TubaTunaName",
        "UM_Adept",
        "UM_AdeptDesc",
        "UM_Aether",
        "UM_AetherDesc",
        "UM_AoEName0",
        "UM_AoEName1",
        "UM_AoEName2",
        "UM_AoEName3",
        "UM_AoEName4",
        "UM_AoEName5",
        "UM_AoEName6",
        "UM_AoEName7",
        "UM_AoEName8",
        "UM_AoEName9",
        "UM_Astra",
        "UM_AstraDesc",
        "UM_BlazeDesc",
        "UM_BlazeName",
        "UM_CombatArts",
        "UM_CombatArtsDesc",
        "UM_DragonFang",
        "UM_DragonFangDesc",
        "UM_Gamble",
        "UM_GambleDesc",
        "UM_Glacies",
        "UM_GlaciesDesc",
        "UM_Ignis",
        "UM_IgnisDesc",
        "UM_Luna",
        "UM_LunaDesc",
        "UM_Lunge",
        "UM_LungeDesc",
        "UM_Mercy",
        "UM_MercyDesc",
        "UM_OvergrowthDesc",
        "UM_OvergrowthName",
        "UM_Pivot",
        "UM_PivotDesc",
        "UM_Rally",
        "UM_RallyDesc",
        "UM_Reposition",
        "UM_RepositionDesc",
        "UM_Shove",
        "UM_ShoveDesc",
        "UM_Smite",
        "UM_SmiteDesc",
        "UM_Sol",
        "UM_SolDesc",
        "UM_SureShot",
        "UM_SureShotDesc",
        "UM_Swap",
        "UM_SwapDesc",
        "UM_Swarp",
        "UM_SwarpDesc",
        "UM_TorrentDesc",
        "UM_TorrentName",
        "UMText_DV",
        "UMText_DVDesc",
        "UnusedTrainerTips3",
        "VeslyName",
        "ZaimName",
        "ZoramineName",
        "LanguageText",
        "LanguageHelpText",
        "EnglishText",
        "SpanishText",
        "ChineseText",
        "UM_GaidenWhiteMagic",
        "DebugTextHere",
        "GiveUpOnMoveText",
        "ReplaceMoveText",
        
    }
)


@dataclass
class TextEntry:
    key: str
    text_id: int | None
    label: str | None
    source: Path
    block: str


def read_definitions(path: Path) -> dict[str, int]:
    definitions: dict[str, int] = {}

    if not path.exists():
        return definitions

    for line in path.read_text(encoding="utf-8-sig").splitlines():
        match = DEFINE_RE.match(line.strip())
        if match:
            definitions[match.group(1)] = int(match.group(2), 16)

    return definitions


def normalize_block(lines: list[str]) -> str:
    while lines and not lines[0].strip():
        lines.pop(0)
    while lines and not lines[-1].strip():
        lines.pop()

    return "\n".join(lines)


def entry_key(text_id: int | None, label: str | None) -> str:
    if label:
        return f"label:{label}"
    if text_id is not None:
        return f"id:{text_id:04X}"

    raise ValueError("entry has neither label nor text ID")


def parse_entry_header(line: str, definitions: dict[str, int]) -> tuple[int | None, str | None] | None:
    match = LABEL_ENTRY_RE.match(line)
    if match:
        label = match.group(1)
        return definitions.get(label), label

    match = HASH_ENTRY_RE.match(line)
    if match:
        text_id = int(match.group(1), 16)
        label = match.group(2)
        return text_id, label

    return None


def collect_entries(root: Path, buildfile: Path, definitions: dict[str, int]) -> list[TextEntry]:
    entries: list[TextEntry] = []
    seen_files: set[Path] = set()

    def visit(path: Path) -> None:
        path = path.resolve()
        if path in seen_files:
            return
        seen_files.add(path)

        if not path.exists():
            print(f"warning: missing include {path}")
            return

        current_header: tuple[int | None, str | None] | None = None
        current_lines: list[str] = []

        def flush() -> None:
            nonlocal current_header, current_lines

            if current_header is None:
                current_lines = []
                return

            block = normalize_block(current_lines)
            if block:
                text_id, label = current_header
                entries.append(TextEntry(entry_key(text_id, label), text_id, label, path, block))

            current_header = None
            current_lines = []

        for raw_line in path.read_text(encoding="utf-8-sig").splitlines():
            include = INCLUDE_RE.match(raw_line)
            if include:
                flush()
                visit((path.parent / include.group(1)).resolve())
                continue

            header = parse_entry_header(raw_line, definitions)
            if header is not None:
                flush()
                current_header = header
                current_lines = [raw_line]
                continue

            if current_header is not None:
                current_lines.append(raw_line)

        flush()

    visit(buildfile)
    return entries


def write_untranslated(language: str) -> int:
    language_root = LANGUAGE_ROOT / language
    english_defs = read_definitions(ENGLISH_ROOT / "TextDefinitions.event")

    english_entries = collect_entries(ENGLISH_ROOT, ENGLISH_ROOT / "text_buildfile.txt", english_defs)
    language_entries = collect_entries(language_root, language_root / "text_buildfile.txt", english_defs)
    language_keys = {entry.key for entry in language_entries}

    missing = [
        entry
        for entry in english_entries
        if entry.key not in language_keys and entry.label not in EXCEPTION_TEXT_LABELS
    ]
    output = language_root / "untranslated.txt"

    lines = [
        f"// Generated by Language/find_untranslated_text.py for {language}.",
        "// English entries below are not present in this language overlay.",
        "",
    ]

    for entry in missing:
        rel_source = entry.source.relative_to(ROOT).as_posix()
        lines.append(f"// Source: {rel_source}")
        lines.append(entry.block)
        lines.append("")

    output.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")

    print(f"{language}: wrote {len(missing)} missing English entries to {output.relative_to(ROOT)}")
    return len(missing)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("languages", nargs="*", default=DEFAULT_LANGUAGES)
    args = parser.parse_args()

    for language in args.languages:
        write_untranslated(language)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
