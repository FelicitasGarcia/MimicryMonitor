#!/usr/bin/env python3
"""Extract OP and PUA C sources verbatim from two git refs.

OP (Oracle Program) is the older/reference version; PUA (Program Under Analysis)
is the newer version that the Mimicry Monitor instruments. Extraction uses
`git show <ref>:<path>` so the working tree is never touched and no diff markers
leak into the output. Content is written byte-for-byte: sigma alignment is
defined over exact line content, so the sources must not be reformatted.
"""
import argparse
import subprocess
import sys
from pathlib import Path


def git_show(repo: Path, ref: str, path: str) -> bytes:
    """Return the raw bytes of `path` as it exists at `ref`."""
    result = subprocess.run(
        ["git", "-C", str(repo), "show", f"{ref}:{path}"],
        capture_output=True,
    )
    if result.returncode != 0:
        sys.exit(f"git show {ref}:{path} failed:\n{result.stderr.decode(errors='replace')}")
    return result.stdout


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--repo", required=True, type=Path, help="path to the git repository")
    p.add_argument("--pua-sha", required=True, help="commit sha for the PUA (newer version)")
    p.add_argument("--op-sha", default=None,
                   help="commit sha for the OP; defaults to <pua-sha>^ (the parent)")
    p.add_argument("--src", required=True, help="source file path inside the repo, e.g. src/cat.c")
    p.add_argument("--out-dir", required=True, type=Path, help="examples/<name>/ destination")
    p.add_argument("--util", required=True, help="basename for output files, e.g. cat -> catOP.c/catPUA.c")
    args = p.parse_args()

    op_sha = args.op_sha or f"{args.pua_sha}^"
    args.out_dir.mkdir(parents=True, exist_ok=True)

    for ref, suffix in ((op_sha, "OP"), (args.pua_sha, "PUA")):
        content = git_show(args.repo, ref, args.src)
        dest = args.out_dir / f"{args.util}{suffix}.c"
        dest.write_bytes(content)
        print(f"{suffix}: {ref}:{args.src} -> {dest} ({content.count(b'\n')} lines)")

    print(f"OP sha={op_sha}  PUA sha={args.pua_sha}")


if __name__ == "__main__":
    main()
