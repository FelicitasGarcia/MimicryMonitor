#!/usr/bin/env python3
"""Regenera la sección volátil de CLAUDE.md desde el estado real del repo.

Lee git (commit, branch, dirty state) y ``evaluation/bench/results/`` (última
campaña por RQ, tabla panorama desde los ``report.md``), y reescribe el bloque
delimitado por los marcadores AUTO en CLAUDE.md. Todo lo que está fuera de los
marcadores queda intacto.

Uso:
    python evaluation/bench/sync_context.py [--repo RUTA] [--dry-run]
"""

import argparse
import re
import subprocess
import sys
from datetime import date
from pathlib import Path

AUTO_START = "<!-- AUTO:start"
AUTO_END = "<!-- AUTO:end -->"
RQ_DIRS = {"RQ1": "rq1_effect", "RQ2": "rq2_overhead", "RQ3": "rq3_genealogy"}


def git(repo: Path, *args: str) -> str:
    """Ejecuta un comando git en el repo y devuelve stdout sin whitespace."""
    out = subprocess.run(
        ["git", "-C", str(repo), *args],
        capture_output=True, text=True, check=True,
    )
    return out.stdout.strip()


def repo_state(repo: Path) -> str:
    """Línea de estado de git: commit corto, branch y limpieza del árbol."""
    commit = git(repo, "rev-parse", "--short", "HEAD")
    branch = git(repo, "rev-parse", "--abbrev-ref", "HEAD")
    dirty = bool(git(repo, "status", "--porcelain"))
    tree = "cambios sin commitear" if dirty else "working tree limpio"
    return f"commit=`{commit}` · branch=`{branch}` · {tree}"


def latest_campaign(rq_dir: Path) -> Path | None:
    """Campaña (directorio hoja con report.md) modificada más recientemente."""
    reports = sorted(
        rq_dir.rglob("report.md"),
        key=lambda p: p.stat().st_mtime,
        reverse=True,
    )
    return reports[0].parent if reports else None


def summary_table(report: Path) -> str:
    """Extrae la primera tabla markdown de un report.md, o cadena vacía."""
    rows = [
        line for line in report.read_text(encoding="utf-8").splitlines()
        if line.lstrip().startswith("|")
    ]
    return "\n".join(rows)


def build_block(repo: Path) -> str:
    """Construye el contenido del bloque AUTO."""
    results = repo / "evaluation" / "bench" / "results"
    lines = [
        f"_Último sync: {date.today().isoformat()}_",
        "",
        f"**Repo:** {repo_state(repo)}",
        "",
        "**Última campaña por RQ:**",
    ]
    panorama: list[str] = []
    for rq, dirname in RQ_DIRS.items():
        rq_path = results / dirname
        campaign = latest_campaign(rq_path) if rq_path.is_dir() else None
        if campaign is None:
            lines.append(f"- {rq}: _(sin campañas)_")
            continue
        rel = campaign.relative_to(results)
        lines.append(f"- {rq}: `{rel}`")
        if rq == "RQ1":  # la tabla panorama sale de la campaña más nueva de RQ1
            panorama.append(summary_table(campaign / "report.md"))
    if any(panorama):
        lines += ["", "**Tabla resumen (última campaña RQ1):**", "", *panorama]
    return "\n".join(lines)


def splice(claude_md: Path, block: str, dry_run: bool) -> None:
    """Reemplaza el contenido entre marcadores AUTO en CLAUDE.md."""
    text = claude_md.read_text(encoding="utf-8")
    pattern = re.compile(
        rf"({re.escape(AUTO_START)}[^\n]*-->\n).*?(\n{re.escape(AUTO_END)})",
        re.DOTALL,
    )
    if not pattern.search(text):
        sys.exit(f"error: marcadores AUTO no encontrados en {claude_md}")
    updated = pattern.sub(rf"\g<1>{block}\g<2>", text)
    if dry_run:
        print(block)
    else:
        claude_md.write_text(updated, encoding="utf-8")
        print(f"CLAUDE.md actualizado ({claude_md})")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd(),
                        help="raíz del repo (default: cwd)")
    parser.add_argument("--dry-run", action="store_true",
                        help="imprime el bloque sin escribir CLAUDE.md")
    args = parser.parse_args()
    splice(args.repo / "CLAUDE.md", build_block(args.repo), args.dry_run)


if __name__ == "__main__":
    main()
