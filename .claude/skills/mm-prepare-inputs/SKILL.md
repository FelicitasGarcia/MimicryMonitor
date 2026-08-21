---
name: mm-prepare-inputs
description: >-
  Prepare the three inputs a Mimicry Monitor (MM) run consumes: the Oracle
  Program source (OP, the older commit), the Program Under Analysis source
  (PUA, the newer commit), and a sigma.txt file that lists the source-line
  pairs conserved (byte-for-byte identical) between the two versions. Use this
  skill whenever the user wants to set up an MM example, extract OP/PUA C files
  from two consecutive commits (typically of a coreutils utility such as cat),
  regenerate or verify a sigma alignment file, or scaffold an examples/<name>/
  directory for the mimicry pipeline. Trigger it on requests like "prepare the
  inputs for MM", "set up the OP and PUA for <utility>", "build the sigma file
  for these two commits", or "make an MM example from commit X to Y", even when
  the word "sigma" is not used explicitly.
---

# Preparing Mimicry Monitor inputs (OP, PUA, sigma.txt)

## Scope and definitions

A Mimicry Monitor is built statically from three user-supplied inputs (thesis
§3.2.1, §4): the two program sources and the alignment relation σ. This skill
produces exactly those three artifacts and nothing else. It does **not** build
the automaton, run LLVM passes, instrument, or fuzz — those are downstream
pipeline stages.

The three artifacts, per the thesis:

- **OP** (Oracle Program): the *reference / older* version. In a commit pair
  `<sha>^ → <sha>`, OP is the parent commit `<sha>^`.
- **PUA** (Program Under Analysis): the *newer* version, commit `<sha>`. The MM
  instruments the PUA and emits verdicts about whether a σ-aligned OP execution
  exists.
- **σ (sigma)**: a *partial matching between CFG nodes of OP and PUA* (thesis
  §2.1.2, Def. 1). Its construction is out of scope for the MM tool itself, so
  it is provided as external input. In the thesis experiments σ is defined
  concretely as **the source lines that remained unaltered between the two
  commits** — "se consideraron como equivalentes aquellas líneas de código que
  permanecieron inalteradas entre dos commits" (§3.2.1.1). σ is defined over
  **source-line nodes**, not over LLVM IR.

**Critical correctness constraint (thesis Def. 1, §2.1.2):** for two lines to
be σ-paired, the statements at those nodes must read/write equivalent state —
in practice, the paired lines must be **byte-for-byte identical** in OP and
PUA. A pairing between two lines that merely look similar but differ in any
byte is unsound. The verification step below enforces this and must not be
skipped.

The user is the authority on the semantics of their experiment. Do **not**
decide on the user's behalf which functions are "the expensive path", which
commit to use, or whether a result is meaningful. Extract, pair identical
lines, verify identity, and report. Interpretation is the user's job.

## Output layout

Produce, under `examples/<name>/` (name chosen by the user; e.g. `catCU`):

```
examples/<name>/
├── <util>OP.c      # OP source, extracted verbatim from <sha>^
├── <util>PUA.c     # PUA source, extracted verbatim from <sha>
└── sigma.txt       # conserved source-line pairs (format below)
```

Confirm the target directory, the `<util>` basename (e.g. `cat`), and the file
naming with the user if not already specified. The memories/thesis convention
is `catOP.c` / `catPUA.c`.

## sigma.txt format

One conserved pair per line, written as a tuple `(OP_line, PUA_line)`:

```
# sigma.txt - conserved source-line pairs (OP_line, PUA_line)
# <util>OP.c <-> <util>PUA.c   commits <shaOP>..<shaPUA>
(3, 3)
(4, 4)
(7, 9)
(8, 10)
```

Rules:
- First element = 1-based line number in the OP file; second = 1-based line
  number in the PUA file. They diverge once an insertion/deletion shifts the
  PUA numbering.
- Blank lines and lines beginning with `#` are comments/ignored.
- Only include a pair when the two lines are **byte-for-byte identical** (see
  verification). Never pad the file with near-matches.

If the user's MM tool expects a different σ encoding (e.g. `<basicblock>`
identifiers or a JSON matching), ask them for one concrete example line and
adapt `build_sigma.py`/`verify_sigma.py` accordingly rather than assuming.

## Workflow

### 1. Gather inputs
Confirm with the user (check the conversation first — several may already be
known):
- Repository path or clone URL (thesis target: coreutils).
- The **PUA commit sha** (`<sha>`). OP is derived as `<sha>^` unless the user
  names a different OP explicitly. The thesis notes some OPs needed minor manual
  adaptation to compile in the current environment — if the user mentions this,
  respect their adapted OP file rather than re-extracting.
- The **source path inside the repo** (e.g. `src/cat.c`).
- The `examples/<name>/` destination and the `<util>OP.c`/`<util>PUA.c` names.

**Instrumentation scope constraint on commit choice:** the MM pipeline's CFG
builder only analyzes `main()` (`LLVMProcessing.java`'s `CFG_FUNCTION` constant
is hardcoded to `"main"`). Both the conserved (σ-paired) logic *and* the
behavioral divergence between OP and PUA must live inside `main()` itself, not
several call-frames deep in a helper function — otherwise the resulting example
builds but the interesting branch is simply invisible to the monitor. Check the
candidate commit's diff against this constraint *before* extracting: a change
buried in a helper function called from `main()` (e.g. coreutils `cp`'s
`main → do_copy → copy → copy_internal → lseek_copy` chain) is not usable as-is,
even if it's otherwise a perfect example of the behavior you want.

### 2. Extract OP and PUA verbatim
Use `git show <ref>:<path>` for clean extraction (no working-tree contamination,
no diff markers). The helper script does this. Extraction must be verbatim —
do not reformat, re-indent, or "clean up" the sources, because σ is defined over
exact line content and any edit invalidates line-number alignment.

### 3. Generate sigma.txt
Run `scripts/build_sigma.py`. It computes conserved line pairs from the two
extracted files using a line-level longest-common-subsequence (the same notion
of "unchanged lines" a diff uses), emitting only pairs whose line content is
identical. Review the header comment it writes; it records the two shas.

### 4. Verify σ soundness (mandatory)
Run `scripts/verify_sigma.py`. For every pair `(a, b)` in sigma.txt it asserts
`OP[a] == PUA[b]` byte-for-byte and fails loudly on any mismatch. A sigma.txt
that does not pass this check must not be handed to the pipeline. Report the
pass/fail result and the pair count to the user; do not judge whether the count
is "good" — that is theirs to interpret.

### 5. Report
Tell the user the three file paths, the number of conserved pairs, and the
verification result. Present the files. Stop there — do not proceed to automaton
construction, instrumentation, or analysis unless the user asks.

## Known pitfall: line-wrapped statements disconnect the CFG

`verify_sigma.py` only proves byte-identity of paired lines — it cannot catch
this, because it's not a σ-soundness problem in the thesis sense. It's a
limitation of the *downstream* CFG builder (`LLVMProcessing.splitBasicBlocks`
in `monitor/`), which creates one graph node per source line and wires
predecessors/successors with a naive 1:1 block-to-node correspondence. When a
single C statement is wrapped across two physical lines by upstream's own
formatting (common with a ternary or a short-circuit condition, e.g.
```c
int copy_cat_status =
  out_isreg && S_ISREG (istat_buf.st_mode) ? copy_cat () : 0;
```
), the wiring can fail to connect the second line's node to its true
predecessor, leaving it disconnected. `castDualVersion` then treats any node
with no incoming edge as a second, spurious function entry point — so `main()`
ends up with two `Entry` edges instead of one. That's not cosmetic: it makes
`Entry`'s source (the automaton's START node) have two children, which makes
`isBranch()` (checks `source.children.size() > 1`) wrongly classify *both*
`Entry` edges as real conditions. The minimizer's `hideLabels()` then refuses
to hide them, so a real `Entry` transition survives into the runtime automaton
— one that never fires at runtime, because `Entry` isn't a real instrumented
branch. Every fuzzed/tested input then desyncs the monitor immediately and no
verdict (V or IV) is ever reached, for any input, even though the build
succeeds cleanly and sigma verifies clean.

**Symptom:** a freshly-built example's smoke test always stalls. The `-log`
trace (`/tmp/mm_monitor.log`) shows `transition: missing -> monitoring
stopped` right after the very first real branch, one step in.

**Detection recipe (cheap, do this whenever a fresh example won't verdict):**
run `pipeline/analyze.sh` for the example (even with `-no-render`, this always
writes `work/dots/llvmBasedResults/OP_CFG_DOT.dot` and `PUA_CFG_DOT.dot`), then
`grep -c 'label="Entry"' work/dots/llvmBasedResults/{OP,PUA}_CFG_DOT.dot`.
Exactly 1 each is healthy. More than 1 on either side means an orphaned node
exists (only PUA's copy of the defect actually matters for the final
automaton — `LabeledCFG`'s `joinAlphabets()` gives PUA prevalence for edges
sharing a label, so PUA's `Entry` edge silently wins over OP's — but fix both
sides for consistency if both are wrapped). The disconnected node's line
content is a fast pointer to which statement to look at.

**Fix:** re-join the wrapped statement onto a single line in OP and/or PUA —
semantically identical to upstream, just reformatted whitespace, so it doesn't
compromise "verbatim extraction" in any way that matters (σ cares about
statement content, not upstream's line-wrap choices). This shifts every
subsequent line number, so re-run `build_sigma.py` and `verify_sigma.py`
afterward — do not hand-patch the old sigma.txt.

## Helper scripts

- `scripts/extract_versions.py` — extract OP/PUA C sources from two git refs via
  `git show`, into `examples/<name>/`. Run `--help` for arguments.
- `scripts/build_sigma.py` — compute conserved line pairs (identical-line LCS)
  and write `sigma.txt`.
- `scripts/verify_sigma.py` — assert byte-for-byte identity of every σ pair;
  non-zero exit on any violation.

Each script is small, documented, and does one thing. Read the script before
running it if the user's setup deviates from the defaults above.
