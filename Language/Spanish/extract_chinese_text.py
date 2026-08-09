from pathlib import Path
import argparse
import csv
import importlib.util
import json
import os
import re
import shutil
from types import SimpleNamespace


ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
OLD_TEXT = ROOT / "Pokemblem-Text1.20"
CURRENT_TEXT = ROOT / "Text"
CHINESE_DUMP = HERE / "chinese.txt"
VANILLA_DUMP = HERE / "vanilla.txt"
EDITED_DUMP = HERE / "chinese_edited.txt"
OLD_TEXT_SNAPSHOT = HERE / "pokemblem_text_1_20_entries.json"
OUT = HERE / "text_buildfile.txt"
VANILLA_TEXT_LIMIT = 0xDB4
CLASS_TABLE = ROOT / "Tables" / "NightmareModules" / "CharactersClasses" / "ClassTable.csv"


def load_text_process():
    path = ROOT / "Tools" / "TextProcess" / "text-process-classic.py"
    spec = importlib.util.spec_from_file_location("text_process_classic", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def load_entries(text_process, buildfile):
    previous = Path.cwd()
    os.chdir(buildfile.parent)
    try:
        lines = text_process.Preprocessor(False).preprocess(buildfile.name)
        return list(text_process.generate_text_entries(lines, False))
    finally:
        os.chdir(previous)


def load_old_entries(text_process):
    old_buildfile = OLD_TEXT / "text_buildfile.txt"

    if old_buildfile.exists():
        return load_entries(text_process, old_buildfile)

    if not OLD_TEXT_SNAPSHOT.exists():
        raise FileNotFoundError(
            f"Missing {old_buildfile} and {OLD_TEXT_SNAPSHOT}; cannot map old 1.20 text ids"
        )

    with OLD_TEXT_SNAPSHOT.open(encoding="utf-8") as fp:
        entries = json.load(fp)

    return [
        SimpleNamespace(
            stringId=entry["stringId"],
            definition=entry.get("definition"),
            text=entry["text"],
        )
        for entry in entries
    ]


def save_old_entries_snapshot(entries):
    snapshot = [
        {
            "stringId": entry.stringId,
            "definition": entry.definition,
            "text": entry.text,
        }
        for entry in entries
    ]

    OLD_TEXT_SNAPSHOT.write_text(
        json.dumps(snapshot, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
        newline="\n",
    )


def load_dump(path):
    entries = {}
    current_id = None
    current_lines = []
    header = re.compile(r"\[([0-9A-Fa-f]+)\]")

    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        match = header.fullmatch(line.strip())
        if match:
            if current_id is not None:
                entries[current_id] = "\n".join(current_lines)
            current_id = int(match.group(1), 16)
            current_lines = []
        else:
            current_lines.append(line)

    if current_id is not None:
        entries[current_id] = "\n".join(current_lines)

    return entries


def write_dump(path, entries):
    lines = []
    for text_id, raw in sorted(entries.items()):
        lines.append(f"[{text_id:02X}]")
        lines.extend(raw.replace("\x1f", "[.]").split("\n"))

    path.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")


def load_class_table_text_definitions():
    if not CLASS_TABLE.exists():
        return set()

    definitions = set()
    with CLASS_TABLE.open(encoding="utf-8-sig", newline="") as fp:
        for row in csv.reader(fp):
            if not row or row[0].startswith("INLINE "):
                continue

            for cell in row[1:3]:
                cell = cell.strip()
                if cell and not re.fullmatch(r"0x[0-9A-Fa-f]+", cell):
                    definitions.add(cell)

    return definitions


def refresh_edited_dump(old_entries):
    chinese_entries = load_dump(CHINESE_DUMP)
    vanilla_entries = load_dump(VANILLA_DUMP)
    old_by_id = {entry.stringId: entry for entry in old_entries}
    edited_entries = {}

    for text_id, raw in chinese_entries.items():
        if text_id in vanilla_entries:
            if comparable_dump(raw) != comparable_dump(vanilla_entries[text_id]):
                edited_entries[text_id] = raw
            continue

        old_entry = old_by_id.get(text_id)
        if old_entry is None:
            continue

        source = dump_text_to_source(raw)
        if has_useful_translation(source, old_entry.text):
            edited_entries[text_id] = raw

    write_dump(EDITED_DUMP, edited_entries)
    return edited_entries


def dump_text_to_source(raw):
    text = raw.replace("\r\n", "\n").replace("\r", "\n").strip("\n")
    text = text.replace("\x1f", "[.]")
    text = text.replace("[DragonIcon]", "[0x7F]")
    text = text.replace("[FastPrint2]", "[FastPrint]")
    text = re.sub(
        r"\[LoadFace\]\[0x([0-9A-Fa-f]{3,})\]",
        lambda match: f"[LoadFace][0x{int(match.group(1), 16) & 0xFF:X}][0x{int(match.group(1), 16) >> 8:X}]",
        text,
    )

    lines = text.split("\n") if text else [""]
    source = "[N]\n".join(lines)
    return source + "[X]"


def comparable(text):
    return text.replace("\r\n", "\n").replace("\r", "\n").strip()


def comparable_dump(text):
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    return text.replace("\x1f", "[.]").strip()


def has_useful_translation(source, old_source):
    if not source or source == "[X]":
        return False

    if comparable(source) != comparable(old_source):
        return True

    return any(ord(ch) > 0x7F for ch in source)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--refresh-edited",
        action="store_true",
        help="recreate chinese_edited.txt from chinese.txt and vanilla.txt",
    )
    parser.add_argument(
        "--save-old-snapshot",
        action="store_true",
        help="save the old Pokemblem-Text1.20 text id/label map into Language/Chinese",
    )
    args = parser.parse_args()

    text_process = load_text_process()
    old_entries = load_old_entries(text_process)
    if args.save_old_snapshot:
        save_old_entries_snapshot(old_entries)
    current_entries = load_entries(text_process, CURRENT_TEXT / "text_buildfile.txt")
    if args.refresh_edited:
        dump_entries = refresh_edited_dump(old_entries)
    else:
        if not EDITED_DUMP.exists():
            parser.error("chinese_edited.txt is missing; run with --refresh-edited first")
        dump_entries = load_dump(EDITED_DUMP)

    old_by_id = {entry.stringId: entry for entry in old_entries}
    current_by_id = {entry.stringId: entry for entry in current_entries}
    current_by_definition = {
        entry.definition: entry
        for entry in current_entries
        if entry.definition
    }

    generated = {}
    mapped_vanilla_by_number = 0
    mapped_by_definition = 0
    mapped_by_number = 0
    forced_class_labels = 0
    skipped_missing_current = 0
    skipped_missing_old = 0

    for text_id, raw in sorted(dump_entries.items()):
        source = dump_text_to_source(raw)

        if text_id < VANILLA_TEXT_LIMIT:
            current_entry = current_by_id.get(text_id)
            definition = current_entry.definition if current_entry else None
            generated[text_id] = (definition, source)
            mapped_vanilla_by_number += 1
            continue

        old_entry = old_by_id.get(text_id)
        if old_entry is None:
            skipped_missing_old += 1
            continue

        if old_entry.definition:
            current_entry = current_by_definition.get(old_entry.definition)
            if current_entry is None:
                skipped_missing_current += 1
                continue

            generated[current_entry.stringId] = (current_entry.definition, source)
            mapped_by_definition += 1
            continue

        current_entry = current_by_id.get(old_entry.stringId)
        if current_entry is None:
            skipped_missing_current += 1
            continue

        if comparable(current_entry.text) != comparable(old_entry.text):
            skipped_missing_current += 1
            continue

        generated[current_entry.stringId] = (current_entry.definition, source)
        mapped_by_number += 1

    chinese_dump_entries = load_dump(CHINESE_DUMP) if CHINESE_DUMP.exists() else {}
    for definition in sorted(load_class_table_text_definitions()):
        current_entry = current_by_definition.get(definition)
        if current_entry is None or current_entry.stringId in generated:
            continue

        raw = chinese_dump_entries.get(current_entry.stringId)
        if raw is not None:
            source = dump_text_to_source(raw)
        else:
            source = current_entry.text

        generated[current_entry.stringId] = (definition, source)
        forced_class_labels += 1

    lines = [
        "// Generated by extract_chinese_text.py.",
        "// Source dump: Language/Chinese/chinese_edited.txt.",
        "// Refresh it from chinese.txt and vanilla.txt with --refresh-edited.",
        "// Labels are mapped from the saved Pokemblem 1.20 text snapshot to the current Text table where possible.",
        "",
    ]

    for text_id, (definition, source) in sorted(generated.items()):
        if definition:
            lines.append(f"# 0x{text_id:03X} {definition}")
        else:
            lines.append(f"# 0x{text_id:03X}")
        lines.append(source)
        lines.append("")

    OUT.write_text("\n".join(lines), encoding="utf-8", newline="\n")

    parse_source = CURRENT_TEXT / "ParseDefinitions.txt"
    parse_target = HERE / "ParseDefinitions.txt"
    if not parse_target.exists() or parse_target.read_bytes() != parse_source.read_bytes():
        shutil.copy2(parse_source, parse_target)

    print(f"wrote {OUT.relative_to(ROOT)}")
    print(f"edited dump entries: {len(dump_entries)}")
    print(f"mapped vanilla by numeric id: {mapped_vanilla_by_number}")
    print(f"mapped by definition: {mapped_by_definition}")
    print(f"mapped by stable numeric id: {mapped_by_number}")
    print(f"forced class-table labels: {forced_class_labels}")
    print(f"skipped missing current slot: {skipped_missing_current}")
    print(f"skipped missing old entry: {skipped_missing_old}")


if __name__ == "__main__":
    main()
