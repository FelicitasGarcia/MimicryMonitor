#!/usr/bin/env python3
"""
afl_provenance_export.py -- combine afl_provenance.py's ancestry graph with
afl_provenance_label.py's target-patch labels, and export:

  * a CSV edge list (one row per child->parent edge, two rows for a splice's
    two parents, one parentless row for a seed root) -- for downstream
    Markov-chain / monitor-trajectory analysis over mutation operators.
  * a Graphviz DOT ancestry forest, restricted to target-hitting queue
    entries and their full ancestor closure (the whole per-campaign queue is
    100-200+ nodes; the target-hitting subgraph is what's actually of
    interest and stays readable).

One CSV+DOT pair is written per campaign trial dir (lineage is inherently
trial-scoped: AFL queue ids are only meaningful within one instance's own
numbering, see afl_provenance.py). A combined CSV across all requested trials
is also written, disambiguated by campaign/trial/instance columns.

Usage:
    python3 afl_provenance_export.py CAMPAIGN_TRIAL_DIR [CAMPAIGN_TRIAL_DIR ...] --out DIR
    python3 afl_provenance_export.py --all-campaigns --out evaluation/bench/results/rq3_genealogy
"""
import argparse
import csv
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import afl_provenance as ap            # noqa: E402
import afl_provenance_label as lbl     # noqa: E402


def build_edge_rows(trial_dir, campaign, instances, labels):
    """One row per (child, parent) edge in this trial's queue; roots get one
    parentless row. `instances` covers just this trial (single-instance)."""
    inst_name, inst = next(iter(instances.items()))
    rows = []
    for node in inst["queue"].values():
        label = labels.get(node["name"], {})
        base = {
            "campaign": campaign,
            "trial": str(trial_dir),
            "instance": inst_name,
            "child_id": node["id"],
            "child_name": node["name"],
            "kind": node["kind"],
            "op": node["fields"].get("op", ""),
            "rep": node["fields"].get("rep", ""),
            "pos": node["fields"].get("pos", ""),
            "cov": "+cov" in node["fields"]["flags"],
            "target_hit": label.get("target_hit"),
            "steps": label.get("steps"),
        }
        if not node["parents"]:
            rows.append({**base, "parent_instance": "", "parent_id": ""})
            continue
        for pid in node["parents"]:
            parent_inst = ap.parent_instance_of(node)
            rows.append({**base, "parent_instance": parent_inst, "parent_id": pid})
    return rows


def ancestor_closure(instances, labels):
    """(instance, id) keys for every queue entry that hits the target, plus
    every ancestor reachable from one, transitively."""
    hitting = []
    for inst_name, inst in instances.items():
        for node in inst["queue"].values():
            if labels.get(node["name"], {}).get("target_hit"):
                hitting.append(node)

    closure = set()
    stack = list(hitting)
    while stack:
        node = stack.pop()
        key = (node["instance"], node["id"])
        if key in closure:
            continue
        closure.add(key)
        for pid in node["parents"]:
            parent, pinst = ap.resolve_parent(node, instances, pid)
            if parent is not None:
                stack.append(parent)
    return closure, hitting


def write_csv(rows, path):
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = ["campaign", "trial", "instance", "child_id", "child_name", "kind",
                  "op", "rep", "pos", "cov", "target_hit", "steps",
                  "parent_instance", "parent_id"]
    with path.open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(rows)


def dot_escape(s):
    return str(s).replace('"', '\\"')


def write_dot(instances, closure, hitting_keys, labels, path):
    path.parent.mkdir(parents=True, exist_ok=True)
    lines = ["digraph provenance {", '  rankdir="BT";', '  node [fontsize=10];']
    for inst_name, inst in instances.items():
        for node in inst["queue"].values():
            key = (node["instance"], node["id"])
            if key not in closure:
                continue
            node_id = f'"{inst_name}:{node["id"]}"'
            is_root = not node["parents"]
            is_hit = key in hitting_keys
            shape = "doublecircle" if is_root else "ellipse"
            color = "style=filled,fillcolor=salmon" if is_hit else \
                    ("style=filled,fillcolor=lightgray" if is_root else "")
            label = f"{inst_name}:{node['id']}"
            attrs = f'label="{dot_escape(label)}",shape={shape}'
            if color:
                attrs += f",{color}"
            lines.append(f"  {node_id} [{attrs}];")
            for pid in node["parents"]:
                parent, pinst = ap.resolve_parent(node, instances, pid)
                if parent is None or (pinst, pid) not in closure:
                    continue
                parent_id = f'"{pinst}:{pid}"'
                op = node["fields"].get("op", "")
                lines.append(f'  {parent_id} -> {node_id} [label="{dot_escape(op)}",fontsize=8];')
    lines.append("}")
    path.write_text("\n".join(lines) + "\n")


def export_trial(trial_dir, campaign, labels, out_dir):
    instances = ap.build_instances(trial_dir)

    rows = build_edge_rows(trial_dir, campaign, instances, labels)
    closure, hitting = ancestor_closure(instances, labels)
    hitting_keys = {(n["instance"], n["id"]) for n in hitting}

    trial_tag = "_".join(Path(trial_dir).parts[-4:-1])  # campaign_variant_tN
    write_csv(rows, out_dir / f"{trial_tag}_edges.csv")
    write_dot(instances, closure, hitting_keys, labels, out_dir / f"{trial_tag}_ancestry.dot")
    return rows, len(hitting), len(closure)


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("dirs", nargs="*", help="campaign trial dir(s)")
    p.add_argument("--all-campaigns", action="store_true",
                   help=f"export every trial dir under {lbl.RESULTS_ROOT}")
    p.add_argument("--out", type=Path, required=True, help="output directory")
    args = p.parse_args()

    if args.all_campaigns:
        dirs = lbl.discover_campaign_trial_dirs()
    elif args.dirs:
        dirs = [Path(d) for d in args.dirs]
    else:
        sys.exit("[error] pass campaign trial dir(s) or --all-campaigns")

    args.out.mkdir(parents=True, exist_ok=True)

    # Group by campaign so label_campaign() shares one compiled wrapper and
    # one content-hash cache across all of a campaign's sibling trials,
    # instead of rebuilding/re-replaying from scratch per trial.
    by_campaign = {}
    for d in dirs:
        by_campaign.setdefault(lbl.campaign_name_from_path(d), []).append(d)

    all_rows = []
    for campaign, trial_dirs in sorted(by_campaign.items()):
        labels_by_trial, _ = lbl.label_campaign(trial_dirs)
        for d in trial_dirs:
            labels = labels_by_trial[str(d)]
            rows, n_hit, n_closure = export_trial(d, campaign, labels, args.out)
            all_rows.extend(rows)
            print(f"[export] {d}: {n_hit} target-hitting nodes, "
                  f"{n_closure}-node ancestry closure, {len(rows)} edges")

    write_csv(all_rows, args.out / "combined_edges.csv")
    print(f"[export] combined -> {args.out / 'combined_edges.csv'} ({len(all_rows)} rows)")


if __name__ == "__main__":
    main()
