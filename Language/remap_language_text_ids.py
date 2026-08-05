#!/usr/bin/env python3
"""Remap language overlay installer IDs to the current main text definitions."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LANGUAGE_ROOT = Path(__file__).resolve().parent

MAIN_DEFINITIONS = ROOT / "Text" / "TextDefinitions.event"

DEFINE_RE = re.compile(r"^#define\s+(\w+)\s+\$([0-9A-Fa-f]+)\s*$")
SET_TEXT_RE = re.compile(r"setText\(\$([0-9A-Fa-f]+),\s*([A-Za-z_][A-Za-z0-9_]*)\)")
TEXT_PROCESS_LABEL_RE = re.compile(r"__TEXTPROCESS([0-9A-Fa-f]+)$")


def read_definitions(path: Path) -> dict[str, int]:
    definitions: dict[str, int] = {}

    for line in path.read_text(encoding="utf-8").splitlines():
        match = DEFINE_RE.match(line.strip())
        if match:
            definitions[match.group(1)] = int(match.group(2), 16)

    return definitions


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: remap_language_text_ids.py <language-folder>")
        return 2

    language_dir = Path(sys.argv[1])
    if not language_dir.is_absolute():
        language_dir = LANGUAGE_ROOT / language_dir

    language_dir = language_dir.resolve()
    language_name = language_dir.name
    language_definitions = language_dir / "TextDefinitions.event"
    language_installer = language_dir / "InstallTextData.event"

    main_defs = read_definitions(MAIN_DEFINITIONS)
    language_defs = read_definitions(language_definitions)
    language_id_to_name = {value: name for name, value in language_defs.items()}

    installer = language_installer.read_text(encoding="utf-8")
    remapped = 0
    missing: list[str] = []
    used_targets: dict[int, str] = {}
    duplicate_targets: dict[int, list[str]] = {}

    def replace_set_text(match: re.Match[str]) -> str:
        nonlocal remapped

        target_id = int(match.group(1), 16)
        data_label = match.group(2)
        source_match = TEXT_PROCESS_LABEL_RE.match(data_label)
        source_id = int(source_match.group(1), 16) if source_match else target_id
        name = language_id_to_name.get(source_id)

        if name is None:
            return match.group(0)

        new_id = main_defs.get(name)
        if new_id is None:
            missing.append(name)
            return match.group(0)

        if new_id != target_id:
            remapped += 1

        previous = used_targets.get(new_id)
        if previous is None:
            used_targets[new_id] = name
        elif previous != name:
            duplicate_targets.setdefault(new_id, [previous]).append(name)

        return f"setText(${new_id:X}, {data_label})"

    installer = SET_TEXT_RE.sub(replace_set_text, installer)

    language_installer.write_text(installer, encoding="utf-8")

    print(f"{language_name} text ID remap: {remapped} entries moved to current IDs.")

    if missing:
        unique_missing = sorted(set(missing))
        print(f"{language_name} text ID remap: {len(unique_missing)} labels not found in main definitions.")
        for name in unique_missing[:20]:
            print(f"  {name}")

        if len(unique_missing) > 20:
            print(f"  ... and {len(unique_missing) - 20} more")

    if duplicate_targets:
        print(f"{language_name} text ID remap: {len(duplicate_targets)} duplicate target IDs found.")
        for text_id, names in sorted(duplicate_targets.items())[:20]:
            print(f"  ${text_id:X}: {', '.join(names)}")

        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
