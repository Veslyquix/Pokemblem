#!/usr/bin/env python3
"""
Copy selected values from "bst test pkmn.ods" into the class CSV tables.

Rows 1 and 2 in each destination CSV are left untouched. Source row 3 is copied
to destination row 3, source row 4 to destination row 4, and so on.

Before writing the updated CSVs, this also writes bstChanges.csv with one row
for each value that will change.
"""

from __future__ import annotations

import argparse
import csv
import zipfile
from copy import copy
from decimal import Decimal, InvalidOperation
from pathlib import Path
from xml.etree import ElementTree as ET


ROOT = Path(__file__).resolve().parent
SOURCE_ODS = ROOT / "bst test pkmn.ods"
CLASS_TABLE_CSV = ROOT / "Tables" / "NightmareModules" / "CharactersClasses" / "ClassTable.csv"
MAG_CLASS_CSV = ROOT / "Tables" / "NightmareModules" / "CharactersClasses" / "MagClassEditor.csv"
CHANGES_CSV = ROOT / "bstChanges.csv"
START_ROW_INDEX = 2

NS = {
    "office": "urn:oasis:names:tc:opendocument:xmlns:office:1.0",
    "table": "urn:oasis:names:tc:opendocument:xmlns:table:1.0",
    "text": "urn:oasis:names:tc:opendocument:xmlns:text:1.0",
}

TABLE = f"{{{NS['table']}}}"
OFFICE = f"{{{NS['office']}}}"


CLASS_TABLE_MAP = {
    "AH": "J",
    "AI": "K",
    "AJ": "L",
    "AK": "M",
    "AL": "N",
    "AM": "O",
    "W": "Z",
    "X": "AA",
    "Y": "AB",
    "Z": "AC",
    "AA": "AD",
    "AB": "AE",
    "AP": "R",
    "AQ": "S",
    "AR": "T",
    "AS": "U",
    "AT": "V",
    "AU": "W",
    "AY": "AG",
    "AZ": "AH",
    "BA": "AI",
    "BB": "AJ",
    "BC": "AK",
    "BD": "AL",
}

MAG_CLASS_MAP = {
    "AN": "B",
    "AV": "D",
    "AC": "C",
    "BE": "E",
}


def column_index(column: str) -> int:
    """Return a zero-based index for a spreadsheet column label."""
    index = 0
    for char in column.upper():
        if not ("A" <= char <= "Z"):
            raise ValueError(f"Invalid column label: {column}")
        index = index * 26 + (ord(char) - ord("A") + 1)
    return index - 1


def column_value(row: list[str], index: int) -> str:
    return row[index] if index < len(row) else ""


def difference_value(old_value: str, new_value: str) -> str:
    try:
        old_number = Decimal(old_value)
        new_number = Decimal(new_value)
    except InvalidOperation:
        return ""

    difference = new_number - old_number
    if difference == difference.to_integral_value():
        return str(int(difference))
    return format(difference.normalize(), "f")


def cell_text(cell: ET.Element) -> str:
    paragraphs = []
    for paragraph in cell.findall("text:p", NS):
        paragraphs.append("".join(paragraph.itertext()))
    return "\n".join(paragraphs)


def cell_value(cell: ET.Element) -> str:
    value_type = cell.attrib.get(f"{OFFICE}value-type")
    if not value_type:
        return ""

    if value_type == "string":
        return cell.attrib.get(f"{OFFICE}string-value", cell_text(cell))

    if value_type in {"float", "percentage", "currency"}:
        return cell.attrib.get(f"{OFFICE}value", cell_text(cell))

    if value_type == "boolean":
        return cell.attrib.get(f"{OFFICE}boolean-value", cell_text(cell))

    if value_type == "date":
        return cell.attrib.get(f"{OFFICE}date-value", cell_text(cell))

    if value_type == "time":
        return cell.attrib.get(f"{OFFICE}time-value", cell_text(cell))

    return cell_text(cell)


def read_ods_rows(path: Path, sheet_name: str, max_cols: int, max_rows: int) -> list[list[str]]:
    with zipfile.ZipFile(path) as ods:
        content = ods.read("content.xml")

    root = ET.fromstring(content)
    sheets = root.findall(".//table:table", NS)
    sheet = next((s for s in sheets if s.attrib.get(f"{TABLE}name") == sheet_name), None)
    if sheet is None:
        available = ", ".join(s.attrib.get(f"{TABLE}name", "<unnamed>") for s in sheets)
        raise ValueError(f'Sheet "{sheet_name}" not found in {path.name}. Available sheets: {available}')

    rows: list[list[str]] = []
    for ods_row in sheet.findall("table:table-row", NS):
        if len(rows) >= max_rows:
            break

        row_values: list[str] = []
        for cell in list(ods_row):
            if not cell.tag.endswith("table-cell") and not cell.tag.endswith("covered-table-cell"):
                continue

            repeat = int(cell.attrib.get(f"{TABLE}number-columns-repeated", "1"))
            value = "" if cell.tag.endswith("covered-table-cell") else cell_value(cell)
            while repeat > 0 and len(row_values) < max_cols:
                row_values.append(value)
                repeat -= 1

            if len(row_values) >= max_cols:
                break

        if len(row_values) < max_cols:
            row_values.extend([""] * (max_cols - len(row_values)))

        repeat_rows = int(ods_row.attrib.get(f"{TABLE}number-rows-repeated", "1"))
        for _ in range(repeat_rows):
            if len(rows) >= max_rows:
                break
            rows.append(copy(row_values))

    return rows


def read_csv(path: Path) -> list[list[str]]:
    with path.open("r", newline="", encoding="utf-8-sig") as handle:
        return list(csv.reader(handle))


def write_csv(path: Path, rows: list[list[str]]) -> None:
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator="\n")
        writer.writerows(rows)


def build_changes(
    table_name: str,
    source_rows: list[list[str]],
    dest_rows: list[list[str]],
    mapping: dict[str, str],
) -> list[list[str]]:
    changes: list[list[str]] = []
    rows_to_check = min(len(source_rows), len(dest_rows))

    for row_index in range(START_ROW_INDEX, rows_to_check):
        source_row = source_rows[row_index]
        dest_row = dest_rows[row_index]
        pokemon = column_value(dest_row, 0) or column_value(source_row, 0)

        for source_column, dest_column in mapping.items():
            source_col_index = column_index(source_column)
            dest_col_index = column_index(dest_column)
            old_value = column_value(dest_row, dest_col_index)
            new_value = column_value(source_row, source_col_index)

            if old_value == new_value:
                continue

            changes.append(
                [
                    pokemon,
                    column_value(dest_rows[0], dest_col_index) if dest_rows else "",
                    old_value,
                    new_value,
                    difference_value(old_value, new_value),
                ]
            )

    return changes


def write_changes_csv(path: Path, changes: list[list[str]]) -> None:
    rows = [
        [
            "Pokemon",
            "Destination Column",
            "Old Value",
            "New Value",
            "Difference",
        ],
        *changes,
    ]
    write_csv(path, rows)


def print_changes_csv(path: Path) -> None:
    if not path.exists():
        print(f"{path} does not exist yet.")
        return

    print(f"\nContents of {path}:")
    with path.open("r", encoding="utf-8-sig") as handle:
        print(handle.read(), end="")
    print()


def copy_columns(source_rows: list[list[str]], dest_rows: list[list[str]], mapping: dict[str, str]) -> int:
    source_indexes = {column_index(src): column_index(dst) for src, dst in mapping.items()}
    max_dest_col = max(source_indexes.values())
    rows_to_update = min(len(source_rows), len(dest_rows))

    for row_index in range(START_ROW_INDEX, rows_to_update):
        dest_row = dest_rows[row_index]
        if len(dest_row) <= max_dest_col:
            dest_row.extend([""] * (max_dest_col + 1 - len(dest_row)))

        source_row = source_rows[row_index]
        for source_col, dest_col in source_indexes.items():
            dest_row[dest_col] = source_row[source_col] if source_col < len(source_row) else ""

    return max(0, rows_to_update - START_ROW_INDEX)


def main() -> None:
    parser = argparse.ArgumentParser(description="Copy BST test ODS values into class CSV tables.")
    parser.add_argument("--source", type=Path, default=SOURCE_ODS)
    parser.add_argument("--class-table", type=Path, default=CLASS_TABLE_CSV)
    parser.add_argument("--mag-class", type=Path, default=MAG_CLASS_CSV)
    parser.add_argument("--changes", type=Path, default=CHANGES_CSV)
    parser.add_argument("--sheet", default="Sheet1")
    args = parser.parse_args()

    class_rows = read_csv(args.class_table)
    mag_rows = read_csv(args.mag_class)
    max_rows = max(len(class_rows), len(mag_rows))
    max_source_col = max(column_index(col) for col in [*CLASS_TABLE_MAP.keys(), *MAG_CLASS_MAP.keys()])
    source_rows = read_ods_rows(args.source, args.sheet, max_source_col + 1, max_rows)

    changes = [
        *build_changes("ClassTable.csv", source_rows, class_rows, CLASS_TABLE_MAP),
        *build_changes("MagClassEditor.csv", source_rows, mag_rows, MAG_CLASS_MAP),
    ]

    class_updated = copy_columns(source_rows, class_rows, CLASS_TABLE_MAP)
    mag_updated = copy_columns(source_rows, mag_rows, MAG_CLASS_MAP)

    if changes:
        write_changes_csv(args.changes, changes)
    write_csv(args.class_table, class_rows)
    write_csv(args.mag_class, mag_rows)

    if changes:
        print(f"Wrote {len(changes)} changed values to {args.changes}")
    else:
        print(f"No changed values found; left {args.changes} untouched.")
    print(f"Updated {class_updated} data rows in {args.class_table}")
    print(f"Updated {mag_updated} data rows in {args.mag_class}")
    print_changes_csv(args.changes)
    if len(source_rows) < max_rows:
        print(f"Warning: source only had {len(source_rows)} rows; later destination rows were unchanged.")


if __name__ == "__main__":
    main()
