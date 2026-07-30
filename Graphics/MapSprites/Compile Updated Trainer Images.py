#!/usr/bin/env python3
"""Compile updated trainer map sprite PNGs into LZ77-compressed DMPs.

This is a Python wrapper around the same Png2Dmp call used by
``Compile Images.bat``. By default, it only processes PNGs whose matching DMP
is missing or older than the PNG.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parents[1]
PNG2DMP = REPO_ROOT / "EventAssembler" / "Tools" / "Png2Dmp.exe"

TRAINER_DIRS = (
    "Trainer_MMS",
    "Trainer_SMS",
    "Trainer_SMS_Facing",
)


def is_stale(png_path: Path) -> bool:
    dmp_path = png_path.with_suffix(".dmp")
    return not dmp_path.exists() or png_path.stat().st_mtime_ns > dmp_path.stat().st_mtime_ns


def iter_pngs(folder: Path, rebuild_all: bool) -> list[Path]:
    pngs = sorted(path for path in folder.glob("*.png") if path.is_file())
    if rebuild_all:
        return pngs
    return [path for path in pngs if is_stale(path)]


def compile_png(png_path: Path, dry_run: bool) -> int:
    command = [str(PNG2DMP), png_path.name, "--lz77"]
    relative = png_path.relative_to(SCRIPT_DIR)

    if dry_run:
        print(f"Would compile {relative}")
        return 0

    print(f"Compiling {relative}")
    completed = subprocess.run(command, cwd=png_path.parent)
    return completed.returncode


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--all", action="store_true", help="Compile every PNG, even if its DMP is current.")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be compiled without writing DMPs.")
    args = parser.parse_args()

    if not PNG2DMP.exists():
        print(f"Missing Png2Dmp tool: {PNG2DMP}", file=sys.stderr)
        return 1

    pngs: list[Path] = []
    for folder_name in TRAINER_DIRS:
        folder = SCRIPT_DIR / folder_name
        if not folder.exists():
            print(f"Missing trainer sprite folder: {folder}", file=sys.stderr)
            return 1
        pngs.extend(iter_pngs(folder, args.all))

    if not pngs:
        print("No updated trainer PNGs to compile.")
        return 0

    failures = 0
    for png_path in pngs:
        if compile_png(png_path, args.dry_run):
            failures += 1

    compiled = len(pngs) - failures
    action = "Would compile" if args.dry_run else "Compiled"
    print(f"{action} {compiled} trainer PNG(s).")

    if failures:
        print(f"{failures} trainer PNG(s) failed.", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
