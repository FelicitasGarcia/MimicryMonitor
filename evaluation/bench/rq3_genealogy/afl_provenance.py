#!/usr/bin/env python3
"""
afl_provenance.py -- reconstruct the mutation ancestry of AFL/AFL++ test cases
purely from the queue / crashes / hangs filenames. No changes to afl-fuzz needed;
run it after the campaign against the -o output directory.

AFL++ encodes provenance in every saved filename, e.g.:
    id:000123,src:000045,time:...,op:havoc,rep:4,+cov     (a queue entry)
    id:000002,sig:06,src:000123,op:havoc,rep:8            (a crash)
The `src:` field is the id of the PARENT queue entry that was mutated to produce
this one. Following `src` back to an `orig:` seed yields the full lineage.
Splice mutations may record two parents as `src:A+B`.

Single- vs multi-instance (-M/-S) output dirs:
  * Point this at one instance's dir (contains queue/ directly) -- the common
    case for a solo `afl-fuzz -o OUT` run -- and everything resolves locally.
  * Point it at the shared -o ROOT of a parallel run (contains one subdir per
    -M/-S instance, each with its own queue/) and it loads every instance.
    A synced entry's filename carries `sync:<peer>`, and its `src` id is local
    to the PEER's queue, not the receiving instance's -- this script resolves
    that correctly by looking up `<peer>/queue` instead of the local queue.

Caveats worth knowing:
  * Only coverage-INCREASING inputs are ever saved, so this lineage is over the
    "interesting" ancestors (queue entries), not every discarded mutation --
    AFL discards the rest in-memory, they were never written anywhere.
  * The classic havoc `op:` tag ('havoc,rep:N') is coarse -- N stacked random
    tweaks. Build AFL++ with INTROSPECTION=1 if you need the exact per-find
    operator list.
  * `orig:` (root seed entries) preserves the seed's original filename
    verbatim and is always the last field -- if that filename itself contains
    a comma, naively splitting the whole name on "," would corrupt it. This
    script special-cases `orig:` to consume the rest of the name intact.

Usage:
    python3 afl_provenance.py OUT_DIR                # trace every crash + hang
    python3 afl_provenance.py OUT_DIR --id 123       # trace one queue id
    python3 afl_provenance.py OUT_DIR --file NAME    # trace one file (basename)
    python3 afl_provenance.py OUT_DIR --diff         # also show byte-level diffs
    python3 afl_provenance.py -M_ROOT --id 5 --instance fuzzer02
"""
import argparse
import os
import sys
from pathlib import Path


def parse_name(name):
    """'id:123,src:45,op:havoc,rep:4,+cov' -> {'id':'123', ..., 'flags':['+cov']}

    `orig:` is special-cased: AFL++ always writes it as the LAST field and its
    value is the original seed's filename verbatim, which may itself contain
    commas. Once encountered, every remaining token is folded back into its
    value instead of being split further.
    """
    fields = {"flags": []}
    tokens = name.split(",")
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if ":" in tok:
            k, v = tok.split(":", 1)   # split once: keeps 'val:be:+32' intact
            if k == "orig":
                fields[k] = ",".join([v] + tokens[i + 1:])
                break
            fields[k] = v
        elif tok:
            fields["flags"].append(tok)
        i += 1
    return fields


def parents_of(fields):
    """Parent ids as ints. Splice records two: 'src:45+67'. Synced entries
    ('sync:' present) record exactly one -- the id in the PEER's queue."""
    src = fields.get("src")
    if src is None:
        return []
    return [int(x) for x in src.split("+") if x != ""]


def parent_instance_of(node):
    """Which instance's queue a node's `parents` ids should be looked up in."""
    return node["fields"].get("sync") or node["instance"]


def load_dir(d, kind, instance):
    """Read every AFL entry file in directory d, keyed by integer id."""
    entries = {}
    if not os.path.isdir(d):
        return entries
    for name in os.listdir(d):
        if not name.startswith("id:"):
            continue
        f = parse_name(name)
        try:
            eid = int(f["id"])
        except (KeyError, ValueError):
            continue
        entries[eid] = {
            "id": eid,
            "instance": instance,
            "kind": kind,
            "name": name,
            "path": os.path.join(d, name),
            "fields": f,
            "parents": parents_of(f),
        }
    return entries


def discover_instances(root):
    """{instance_name: instance_dir}.

    If `root` itself has a queue/ subdir, it's a single instance. Otherwise
    every child dir that has its own queue/ subdir is treated as one -M/-S
    instance (this is how a shared -o root looks for a parallel campaign)."""
    root = Path(root)
    if (root / "queue").is_dir():
        return {root.name or "main": root}
    instances = {}
    for child in sorted(root.iterdir()):
        if child.is_dir() and (child / "queue").is_dir():
            instances[child.name] = child
    return instances


def build_instances(root):
    """{instance_name: {"queue": {...}, "crashes": {...}, "hangs": {...}}}"""
    instances = discover_instances(root)
    if not instances:
        sys.exit(f"No AFL instance dir(s) found under {root} "
                  f"(expected a queue/ subdir, or child dirs each containing one)")
    out = {}
    for name, d in instances.items():
        out[name] = {
            "queue":   load_dir(os.path.join(d, "queue"), "queue", name),
            "crashes": load_dir(os.path.join(d, "crashes"), "crash", name),
            "hangs":   load_dir(os.path.join(d, "hangs"), "hang", name),
        }
    return out


def resolve_parent(node, instances, pid):
    """Returns (parent_node_or_None, parent_instance_name)."""
    pinst = parent_instance_of(node)
    inst = instances.get(pinst)
    if inst is None:
        return None, pinst
    return inst["queue"].get(pid), pinst


def describe(node, multi=False):
    f = node["fields"]
    op = f.get("op", "-")
    rep = f.get("rep", "")
    rep = f",rep:{rep}" if rep else ""
    pos = f.get("pos", "")
    pos = f",pos:{pos}" if pos else ""
    src = f.get("src")
    src = "orig:" + f.get("orig", "?") if src is None else src
    sync = f.get("sync")
    if sync:
        src = f"sync:{sync},src:{src}"
    tag = "".join(f["flags"])
    prefix = f"{node['instance']}:" if multi else ""
    return f"[{node['kind']:>5}] id:{prefix}{node['id']:<5} src:{src:<20} op:{op}{rep}{pos} {tag}".rstrip()


def byte_diff(a_path, b_path, limit=20):
    a = Path(a_path).read_bytes()
    b = Path(b_path).read_bytes()
    if a == b:
        return "(identical bytes)"
    out = []
    for i in range(min(len(a), len(b))):
        if a[i] != b[i]:
            out.append(f"@{i}:{a[i]:02x}->{b[i]:02x}")
            if len(out) >= limit:
                out.append("...")
                break
    if len(a) != len(b):
        out.append(f"len {len(a)}->{len(b)}")
    return " ".join(out)


def print_tree(node, instances, show_diff, depth=0, seen=None, multi=False):
    """Print the target at the top, ancestors indented beneath, up to the seeds."""
    if seen is None:
        seen = set()
    print("  " * depth + describe(node, multi))
    for pid in node["parents"]:
        parent, pinst = resolve_parent(node, instances, pid)
        pad = "  " * (depth + 1)
        key = (pinst, pid)
        if parent is None:
            reason = (f"synced from '{pinst}' -- that instance dir wasn't loaded "
                      f"or doesn't have this id; pass the shared -o root to resolve it"
                      if node["fields"].get("sync") else
                      "corpus was likely minimized/trimmed after this edge was recorded")
            print(pad + f"|- [missing queue id {pid} in instance '{pinst}'] ({reason})")
            continue
        if show_diff:
            print(pad + f"|- diff {pinst}:{pid}->{node['instance']}:{node['id']}: "
                        + byte_diff(parent["path"], node["path"]))
        if key in seen:
            print(pad + f"|- ({pinst}:{pid} lineage already shown above)")
            continue
        seen.add(key)
        print_tree(parent, instances, show_diff, depth + 1, seen, multi)


def main():
    ap = argparse.ArgumentParser(description="Reconstruct AFL/AFL++ input ancestry.",
                                 formatter_class=argparse.RawDescriptionHelpFormatter,
                                 epilog=__doc__)
    ap.add_argument("out_dir", help="afl-fuzz -o output dir for one instance, "
                                     "or the shared root of a -M/-S parallel run")
    ap.add_argument("--id", type=int, help="trace a single queue id")
    ap.add_argument("--instance", help="instance name to use with --id "
                                        "(default: the only loaded instance)")
    ap.add_argument("--file", help="trace one file by basename (queue/crash/hang)")
    ap.add_argument("--diff", action="store_true", help="show byte-level parent->child diffs")
    args = ap.parse_args()

    instances = build_instances(args.out_dir)
    multi = len(instances) > 1
    if not any(inst["queue"] for inst in instances.values()):
        sys.exit(f"No queue entries under {args.out_dir} -- is this an AFL output dir?")

    if args.id is not None:
        inst_name = args.instance or next(iter(instances))
        if inst_name not in instances:
            sys.exit(f"instance '{inst_name}' not found (loaded: {', '.join(instances)})")
        node = instances[inst_name]["queue"].get(args.id)
        if node is None:
            sys.exit(f"id {args.id} not found in instance '{inst_name}' queue")
        targets = [node]
    elif args.file:
        base = os.path.basename(args.file)
        all_nodes = []
        for d in instances.values():
            all_nodes += list(d["queue"].values()) + list(d["crashes"].values()) + list(d["hangs"].values())
        targets = [n for n in all_nodes if n["name"] == base]
        if not targets:
            sys.exit(f"No entry named {base}")
    else:
        targets = []
        for d in instances.values():
            targets += list(d["crashes"].values()) + list(d["hangs"].values())
        if not targets:
            print("No crashes/hangs found; tracing all queue leaves instead.\n")
            for d in instances.values():
                targets += list(d["queue"].values())

    for t in targets:
        print("=" * 72)
        label = f"{t['instance']}:{t['name']}" if multi else t["name"]
        print("TARGET:", label)
        print("-" * 72)
        print_tree(t, instances, args.diff, multi=multi)
        print()


if __name__ == "__main__":
    main()
