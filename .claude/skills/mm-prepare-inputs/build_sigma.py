#!/usr/bin/env python3
"""Build sigma.txt: the source-line pairs conserved between OP and PUA.

Per the thesis (§3.2.1.1), sigma is the set of source lines that remained
unaltered between the two commits. This script computes that set with a
line-level longest-common-subsequence (the same "unchanged lines" notion a
diff uses) and emits one `OP_line PUA_line` pair per conserved line. Every
emitted pair references lines whose content is identical by construction; the
separate verify_sigma.py step re-checks this before the file is trusted.
"""
import argparse
import sys
from difflib import SequenceMatcher
from pathlib import Path


def read_lines(path: Path) -> list[str]:
    """Read a source file as a list of lines, newline stripped."""
    return path.read_text(encoding="utf-8", errors="replace").splitlines()


def conserved_pairs(op: list[str], pua: list[str]) -> list[tuple[int, int]]:
    """Return 1-based (op_line, pua_line) pairs for identical, order-preserving lines."""
    matcher = SequenceMatcher(a=op, b=pua, autojunk=False)
    pairs: list[tuple[int, int]] = []
    for op_start, pua_start, size in matcher.get_matching_blocks():
        for offset in range(size):
            pairs.append((op_start + offset + 1, pua_start + offset + 1))
    return pairs


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--op", required=True, type=Path, help="path to the OP source file")
    p.add_argument("--pua", required=True, type=Path, help="path to the PUA source file")
    p.add_argument("--out", required=True, type=Path, help="destination sigma.txt")
    p.add_argument("--op-sha", default="?", help="OP commit sha, for the header comment")
    p.add_argument("--pua-sha", default="?", help="PUA commit sha, for the header comment")
    args = p.parse_args()

    op_lines = read_lines(args.op)
    pua_lines = read_lines(args.pua)
    pairs = conserved_pairs(op_lines, pua_lines)

    with args.out.open("w", encoding="utf-8") as f:
        f.write("# sigma.txt - conserved source-line pairs (OP_line, PUA_line)\n")
        f.write(f"# {args.op.name} <-> {args.pua.name}   commits {args.op_sha}..{args.pua_sha}\n")
        for op_line, pua_line in pairs:
            f.write(f"({op_line}, {pua_line})\n")

    print(f"{len(pairs)} conserved pairs -> {args.out}", file=sys.stderr)


if __name__ == "__main__":
    main()
