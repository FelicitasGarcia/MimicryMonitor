#!/usr/bin/env python3
"""Verify every sigma pair references byte-for-byte identical lines.

The MM soundness condition (thesis Def. 1, §2.1.2) requires paired nodes to
access equivalent state; for the line-level sigma used here that means the two
paired lines must be identical. This script asserts that for every pair and
exits non-zero on any violation, so an unsound sigma.txt cannot reach the
pipeline unnoticed.
"""
import argparse
import sys
from pathlib import Path


def read_lines(path: Path) -> list[str]:
    return path.read_text(encoding="utf-8", errors="replace").splitlines()


def parse_sigma(path: Path) -> list[tuple[int, int, int]]:
    """Return (source_lineno, op_line, pua_line) for each non-comment pair.

    Each pair is written as a tuple `(OP_line, PUA_line)`.
    """
    pairs: list[tuple[int, int, int]] = []
    for lineno, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        parts = line.strip("()").split(",")
        if len(parts) != 2:
            sys.exit(f"sigma.txt:{lineno}: expected '(OP_line, PUA_line)', got: {raw!r}")
        try:
            pairs.append((lineno, int(parts[0]), int(parts[1])))
        except ValueError:
            sys.exit(f"sigma.txt:{lineno}: line numbers must be integers: {raw!r}")
    return pairs


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--op", required=True, type=Path, help="path to the OP source file")
    p.add_argument("--pua", required=True, type=Path, help="path to the PUA source file")
    p.add_argument("--sigma", required=True, type=Path, help="path to sigma.txt")
    args = p.parse_args()

    op = read_lines(args.op)
    pua = read_lines(args.pua)
    pairs = parse_sigma(args.sigma)

    violations = 0
    for sigma_lineno, op_line, pua_line in pairs:
        if not (1 <= op_line <= len(op)):
            print(f"sigma.txt:{sigma_lineno}: OP line {op_line} out of range (1..{len(op)})")
            violations += 1
            continue
        if not (1 <= pua_line <= len(pua)):
            print(f"sigma.txt:{sigma_lineno}: PUA line {pua_line} out of range (1..{len(pua)})")
            violations += 1
            continue
        if op[op_line - 1] != pua[pua_line - 1]:
            print(f"sigma.txt:{sigma_lineno}: mismatch")
            print(f"  OP  {op_line}: {op[op_line - 1]!r}")
            print(f"  PUA {pua_line}: {pua[pua_line - 1]!r}")
            violations += 1

    if violations:
        sys.exit(f"FAIL: {violations} unsound pair(s) of {len(pairs)}")
    print(f"OK: all {len(pairs)} pairs are byte-for-byte identical")


if __name__ == "__main__":
    main()
