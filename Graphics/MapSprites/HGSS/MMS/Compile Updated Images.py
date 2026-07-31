#!/usr/bin/env python3
"""Compile only updated HGSS MMS PNGs into LZ77-compressed DMPs.

This mirrors ``.Compile Images.bat`` in this folder, but skips PNGs whose
matching DMP already exists and is newer than the source PNG.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parents[3]
PNG2DMP = REPO_ROOT / "EventAssembler" / "Tools" / "Png2Dmp.exe"


def dmp_path_for(png_path: Path) -> Path:
    return png_path.with_suffix(".dmp")


def is_stale(png_path: Path) -> bool:
    dmp_path = dmp_path_for(png_path)
    return not dmp_path.exists() or png_path.stat().st_mtime_ns > dmp_path.stat().st_mtime_ns


def iter_pngs(rebuild_all: bool) -> list[Path]:
    pngs = sorted(path for path in SCRIPT_DIR.glob("*.png") if path.is_file())
    if rebuild_all:
        return pngs
    return [path for path in pngs if is_stale(path)]


def compile_png(png_path: Path, dry_run: bool) -> int:
    command = [str(PNG2DMP), png_path.name, "--lz77"]

    if dry_run:
        print(f"Would compile {png_path.name}")
        return 0

    print(f"Compiling {png_path.name}")
    completed = subprocess.run(command, cwd=SCRIPT_DIR)
    return completed.returncode


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--all", action="store_true", help="Compile every PNG, even if its DMP is current.")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be compiled without writing DMPs.")
    args = parser.parse_args()

    if not PNG2DMP.exists():
        print(f"Missing Png2Dmp tool: {PNG2DMP}", file=sys.stderr)
        return 1

    pngs = iter_pngs(args.all)
    if not pngs:
        print("No updated HGSS MMS PNGs to compile.")
        return 0

    failures = 0
    for png_path in pngs:
        if compile_png(png_path, args.dry_run):
            failures += 1

    compiled = len(pngs) - failures
    action = "Would compile" if args.dry_run else "Compiled"
    print(f"{action} {compiled} HGSS MMS PNG(s).")

    if failures:
        print(f"{failures} HGSS MMS PNG(s) failed.", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
