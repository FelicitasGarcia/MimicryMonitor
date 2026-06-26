---
name: instrumentation-shortcircuit-bug
description: Root cause and fix for the compound && condition producing an extra "cond" probe, causing 0 target hits in expandCU fuzzing
metadata:
  type: project
---

The LLVM instrumentation pass (`instrumentation/MimicryInstrument.cpp`) instruments ALL conditional branches in `main()` with a "cond" probe. The compound condition `while ((c = getc(fp)) < 0 && (fp = next_file(fp)))` compiles in LLVM IR to **two** conditional branches:
1. Block 71: `icmp slt c, 0` (first half of &&)
2. Block 79: PHI merge `phi i1 [false, monedge.else8], [%78, 75]` (combined && result)

The monitor automaton has only ONE state for this entire while condition. The extra "cond" probe from block 79 caused the monitor to consume states out of sync, producing `early=1 verdict=V steps=12 target=0` for ALL file inputs.

**Why:** Block 79 is a "short-circuit merge": its branch condition is a PHI node where one incoming value is a constant boolean (`false`), which is the IR artifact of `&&` short-circuit evaluation.

**Fix applied in `instrumentation/MimicryInstrument.cpp`:** Before inserting the "cond" probe for a BranchInst, check if the branch condition is a PHI node with any constant-integer incoming value. If so, skip instrumentation of that block entirely (no "cond" probe, no trampolines).

**How to apply:** Any compound `&&` or `||` in sigma-paired conditions will exhibit this issue. The fix is general — it skips any basic block whose branch condition is a PHI merging a constant bool.

**Also fixed:** `target=` field was missing from the `mm_record_stop` format string in `monitor_runtime.c`. Added `target=%d mm_target_reached` to the snprintf call.

**Verified results after fix:**
- tabs file → `early=0 verdict=IV steps=10 target=1` ✓
- no-tabs file → `early=0 verdict=IV steps=10 target=0` ✓
- `--help` → `early=1 verdict=V steps=6 target=0` ✓
