from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
CONF_OBJ_DIR = BASE_DIR / "ConfObj"
DMP_DIR = BASE_DIR / "Dmp"
TOOLS_DIR = BASE_DIR.parent / "EventAssembler" / "Tools"
PNG2DMP = TOOLS_DIR / "Png2Dmp.exe"
COMPRESS = TOOLS_DIR / "compress_tofile.exe"
FOG_FILTER = BASE_DIR / "FogTilesetFilter.py"


def is_stale(source: Path, target: Path) -> bool:
    if not target.exists():
        return True

    return source.stat().st_mtime_ns > target.stat().st_mtime_ns


def run(command: list[str], cwd: Path) -> None:
    subprocess.run(command, cwd=cwd, check=True)


def copy_and_remove(source: Path, target_dir: Path) -> None:
    shutil.copy2(source, target_dir / source.name)
    source.unlink(missing_ok=True)


def compile_png(source: Path) -> None:
    stem = source.stem
    obj_dmp = CONF_OBJ_DIR / f"{stem}.dmp"
    pal_dmp = CONF_OBJ_DIR / f"{stem}_pal.dmp"
    final_pal = DMP_DIR / f"{stem}_pal.dmp"
    final_pal_fog = DMP_DIR / f"{stem}_pal_fog.dmp"

    run([str(PNG2DMP), source.name, "--lz77", "-po", pal_dmp.name], CONF_OBJ_DIR)

    copy_and_remove(obj_dmp, DMP_DIR)
    copy_and_remove(pal_dmp, DMP_DIR)

    run([sys.executable, str(FOG_FILTER), "-i", str(final_pal), "-o", str(final_pal_fog)], BASE_DIR)


def compile_mapchip(source: Path) -> None:
    output = CONF_OBJ_DIR / f"{source.stem}_comp.dmp"

    run([str(COMPRESS), source.name, output.name], CONF_OBJ_DIR)
    copy_and_remove(output, DMP_DIR)


def main() -> int:
    dry_run = "--dry-run" in sys.argv[1:]

    if not CONF_OBJ_DIR.exists():
        print(f"Missing folder: {CONF_OBJ_DIR}")
        return 1

    DMP_DIR.mkdir(exist_ok=True)

    compiled = 0
    skipped = 0

    for source in sorted(CONF_OBJ_DIR.glob("*.png")):
        stem = source.stem
        targets = [
            DMP_DIR / f"{stem}.dmp",
            DMP_DIR / f"{stem}_pal.dmp",
            DMP_DIR / f"{stem}_pal_fog.dmp",
        ]

        if any(is_stale(source, target) for target in targets):
            if dry_run:
                print(f"Would compile {source.name}")
            else:
                print(f"Compiling {source.name}")
                compile_png(source)
            compiled += 1
        else:
            print(f"Skipping {source.name}")
            skipped += 1

    for source in sorted(CONF_OBJ_DIR.glob("*.mapchip_config")):
        target = DMP_DIR / f"{source.stem}_comp.dmp"

        if is_stale(source, target):
            if dry_run:
                print(f"Would compress {source.name}")
            else:
                print(f"Compressing {source.name}")
                compile_mapchip(source)
            compiled += 1
        else:
            print(f"Skipping {source.name}")
            skipped += 1

    if dry_run:
        print(f"Would compile {compiled} file(s), would skip {skipped} unchanged file(s).")
    else:
        print(f"Compiled {compiled} file(s), skipped {skipped} unchanged file(s).")
    print("Done!")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
