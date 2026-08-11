#!/usr/bin/env python3
"""
Tests for afl_provenance.py.

Fixtures are built on the fly (not checked into the repo) so filenames can
contain the real AFL++ delimiter characters (':', ',', '+') without fighting
git/filesystem quirks. Run with:
    evaluation/bench/.venv/bin/python -m unittest evaluation.bench.tests.test_afl_provenance -v
or directly:
    evaluation/bench/.venv/bin/python evaluation/bench/tests/test_afl_provenance.py
"""
import io
import contextlib
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import afl_provenance as ap  # noqa: E402

REPO = Path(__file__).resolve().parents[4]


def write_entries(root, subdir, names, content_prefix=""):
    """Create root/subdir/<name> for each name in names, with distinct content."""
    d = Path(root) / subdir
    d.mkdir(parents=True, exist_ok=True)
    for i, name in enumerate(names):
        (d / name).write_bytes(f"{content_prefix}{i}\n".encode())


class TestParseName(unittest.TestCase):
    def test_basic_fields_and_flags(self):
        f = ap.parse_name("id:000123,src:000045,time:99,execs:5,op:havoc,rep:4,+cov")
        self.assertEqual(f["id"], "000123")
        self.assertEqual(f["src"], "000045")
        self.assertEqual(f["op"], "havoc")
        self.assertEqual(f["rep"], "4")
        self.assertEqual(f["flags"], ["+cov"])

    def test_splice_two_parents(self):
        f = ap.parse_name("id:000003,src:000001+000002,time:2,execs:9,op:libgrammarmutator-cat,pos:0")
        self.assertEqual(ap.parents_of(f), [1, 2])

    def test_orig_field_terminal(self):
        f = ap.parse_name("id:000000,time:0,execs:0,orig:0")
        self.assertEqual(f["orig"], "0")
        self.assertEqual(ap.parents_of(f), [])

    def test_orig_field_with_embedded_commas_not_corrupted(self):
        # AFL++ preserves the original seed filename verbatim after `orig:`,
        # and that filename may itself contain commas. A naive split(",")
        # would truncate it at the first comma -- this is the bug fix.
        f = ap.parse_name("id:000000,time:0,execs:0,orig:seed,with,commas.txt")
        self.assertEqual(f["orig"], "seed,with,commas.txt")
        self.assertNotIn("with", f)  # must not have been split into a bogus field

    def test_sync_field_parsed(self):
        f = ap.parse_name("id:000002,sync:fuzzer01,src:000005,time:2,execs:4,op:havoc,rep:1,+cov")
        self.assertEqual(f["sync"], "fuzzer01")
        self.assertEqual(ap.parents_of(f), [5])


class TestSingleInstanceLineage(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        write_entries(self.root, "queue", [
            "id:000000,time:0,execs:0,orig:0",
            "id:000001,time:0,execs:0,orig:1",
            "id:000002,src:000000,time:1,execs:5,op:havoc,rep:2,+cov",
            "id:000003,src:000001+000002,time:2,execs:9,op:libgrammarmutator-cat,pos:0,+cov",
            # src:000099 does not exist -- simulates a corpus-minimized/culled ancestor
            "id:000004,src:000099,time:3,execs:12,op:havoc,rep:1,+cov",
        ], content_prefix="q")
        write_entries(self.root, "crashes", [
            "id:000000,sig:11,src:000003,time:4,execs:15,op:havoc,rep:3",
        ], content_prefix="c")
        write_entries(self.root, "hangs", [
            "id:000000,src:000002,time:5,execs:20,op:havoc,rep:1",
        ], content_prefix="h")

    def tearDown(self):
        self.tmp.cleanup()

    def test_discover_single_instance(self):
        instances = ap.discover_instances(self.root)
        self.assertEqual(len(instances), 1)
        self.assertEqual(next(iter(instances.values())), self.root)

    def test_build_instances_counts(self):
        instances = ap.build_instances(self.root)
        self.assertEqual(len(instances), 1)
        d = next(iter(instances.values()))
        self.assertEqual(len(d["queue"]), 5)
        self.assertEqual(len(d["crashes"]), 1)
        self.assertEqual(len(d["hangs"]), 1)

    def test_splice_parents_resolve_to_queue(self):
        instances = ap.build_instances(self.root)
        inst = next(iter(instances.values()))
        node3 = inst["queue"][3]
        self.assertEqual(node3["parents"], [1, 2])
        p1, pinst1 = ap.resolve_parent(node3, instances, 1)
        p2, pinst2 = ap.resolve_parent(node3, instances, 2)
        self.assertIsNotNone(p1)
        self.assertIsNotNone(p2)
        self.assertEqual(p1["id"], 1)
        self.assertEqual(p2["id"], 2)

    def test_missing_parent_resolves_to_none_not_exception(self):
        instances = ap.build_instances(self.root)
        inst = next(iter(instances.values()))
        node4 = inst["queue"][4]
        parent, pinst = ap.resolve_parent(node4, instances, 99)
        self.assertIsNone(parent)

    def test_crash_traces_back_through_queue_to_seeds(self):
        instances = ap.build_instances(self.root)
        inst = next(iter(instances.values()))
        crash = inst["crashes"][0]
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            ap.print_tree(crash, instances, show_diff=False)
        out = buf.getvalue()
        # crash(0) -> queue(3) -> queue(1)+queue(2) -> queue(2)'s parent queue(0) -> orig roots
        self.assertIn("id:3", out.replace(" ", ""))
        self.assertIn("orig:0", out)
        self.assertIn("orig:1", out)

    def test_missing_parent_prints_placeholder_and_does_not_raise(self):
        instances = ap.build_instances(self.root)
        inst = next(iter(instances.values()))
        node4 = inst["queue"][4]
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            ap.print_tree(node4, instances, show_diff=False)  # must not raise
        self.assertIn("missing queue id 99", buf.getvalue())

    def test_byte_diff_reports_identical_and_changed(self):
        instances = ap.build_instances(self.root)
        inst = next(iter(instances.values()))
        same = ap.byte_diff(inst["queue"][0]["path"], inst["queue"][0]["path"])
        self.assertEqual(same, "(identical bytes)")
        diff = ap.byte_diff(inst["queue"][0]["path"], inst["queue"][1]["path"])
        self.assertNotEqual(diff, "(identical bytes)")


class TestMultiInstanceSync(unittest.TestCase):
    """-M/-S parallel campaigns: a synced entry's `src` id is local to the
    PEER's queue, not the receiving instance's. This is the scenario the
    original script only *detected* (printed a guess) without resolving."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        write_entries(self.root / "fuzzer01", "queue", [
            "id:000000,time:0,execs:0,orig:0",
            "id:000001,time:0,execs:0,orig:1",
            "id:000002,time:0,execs:0,orig:2",
            "id:000003,time:0,execs:0,orig:3",
            "id:000004,time:0,execs:0,orig:4",
            "id:000005,src:000000,time:1,execs:3,op:havoc,rep:2,+cov",
        ], content_prefix="f1_")
        write_entries(self.root / "fuzzer02", "queue", [
            "id:000000,time:0,execs:0,orig:0",
            "id:000001,src:000000,time:1,execs:1,op:havoc,rep:1,+cov",
            # local id 5 too -- deliberately collides with fuzzer01's id 5,
            # with DIFFERENT content, to prove sync resolution doesn't
            # accidentally fall back to the local same-numbered entry.
            "id:000005,src:000001,time:1,execs:2,op:havoc,rep:1,+cov",
            "id:000002,sync:fuzzer01,src:000005,time:2,execs:4,op:havoc,rep:1,+cov",
        ], content_prefix="f2_")
        self.instances = ap.build_instances(self.root)

    def tearDown(self):
        self.tmp.cleanup()

    def test_discover_multi_instance(self):
        found = ap.discover_instances(self.root)
        self.assertEqual(set(found), {"fuzzer01", "fuzzer02"})

    def test_synced_entry_resolves_to_peer_instance_not_local_collision(self):
        synced = self.instances["fuzzer02"]["queue"][2]
        self.assertEqual(synced["fields"]["sync"], "fuzzer01")
        self.assertEqual(synced["parents"], [5])

        parent, pinst = ap.resolve_parent(synced, self.instances, 5)
        self.assertEqual(pinst, "fuzzer01")
        self.assertIsNotNone(parent)
        self.assertEqual(parent["instance"], "fuzzer01")
        # must be fuzzer01's id 5 content, NOT fuzzer02's colliding local id 5
        self.assertEqual(Path(parent["path"]).read_bytes(),
                         Path(self.instances["fuzzer01"]["queue"][5]["path"]).read_bytes())
        self.assertNotEqual(Path(parent["path"]).read_bytes(),
                            Path(self.instances["fuzzer02"]["queue"][5]["path"]).read_bytes())

    def test_sync_missing_peer_reports_missing_not_wrong_node(self):
        # Loading fuzzer02 ALONE (as if you'd pointed the tool at just that
        # instance dir, not the shared -M/-S root) must not silently resolve
        # the sync reference against fuzzer02's own colliding local id 5.
        solo = ap.build_instances(self.root / "fuzzer02")
        synced = solo["fuzzer02"]["queue"][2]
        parent, pinst = ap.resolve_parent(synced, solo, 5)
        self.assertIsNone(parent)
        self.assertEqual(pinst, "fuzzer01")

    def test_full_tree_print_crosses_instances_without_raising(self):
        synced = self.instances["fuzzer02"]["queue"][2]
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            ap.print_tree(synced, self.instances, show_diff=False, multi=True)
        out = buf.getvalue()
        self.assertIn("fuzzer01:5", out.replace(" ", ""))
        self.assertIn("orig:0", out)


class TestRealCampaignData(unittest.TestCase):
    """Sanity checks against a real (non-synthetic) campaign directory that
    has real saved hangs, to catch anything the synthetic fixtures miss."""

    REAL_DIR = REPO / "evaluation/bench/results/cat/overhead_long/instrumented/t6/default"

    def setUp(self):
        if not self.REAL_DIR.is_dir():
            self.skipTest(f"real campaign dir not present: {self.REAL_DIR}")

    def test_builds_without_error_and_has_entries(self):
        instances = ap.build_instances(self.REAL_DIR)
        inst = next(iter(instances.values()))
        self.assertGreater(len(inst["queue"]), 0)
        self.assertGreater(len(inst["hangs"]), 0)

    def test_every_hang_traces_to_a_root_with_no_missing_ancestors(self):
        instances = ap.build_instances(self.REAL_DIR)
        inst = next(iter(instances.values()))
        for hang in inst["hangs"].values():
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                ap.print_tree(hang, instances, show_diff=False)
            out = buf.getvalue()
            self.assertNotIn("missing queue id", out,
                             f"unexpected gap in real, untrimmed corpus lineage for {hang['name']}")
            self.assertIn("orig:", out, f"lineage for {hang['name']} never reached a seed root")


if __name__ == "__main__":
    unittest.main()
