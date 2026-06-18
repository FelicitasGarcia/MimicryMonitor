#!/bin/bash

# Portable Mimicry pipeline.
#
# Two modes:
#   -export   (Mac) Run the full analysis phase (IR generation, def-use,
#             CFG extraction) and save all artifacts to inputs/canonical_ll/
#             so they can be committed and used on Linux.
#
#   -run      (Linux) Restore the Mac-generated artifacts to their expected
#             locations, then run only the Java monitor construction and
#             instrumentation steps.
#
# Usage:
#   ./run-portable.sh -export [pipeline options]   # on Mac
#   ./run-portable.sh -run   [pipeline options]    # on Linux

set -e

GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PINK='\033[1;35m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

MIMICRY_DIR=$(pwd)
LLVM_DIR="$MIMICRY_DIR/llvm"
SCRIPTS_DIR="$LLVM_DIR/feli/scripts"
OUTPUTS_DIR="$LLVM_DIR/feli/outputs"
INPUTS_DIR="$LLVM_DIR/feli/inputs"
TEMPS_DIR="$LLVM_DIR/feli/temps"
CFGS_DIR="$LLVM_DIR/feli/cfgs"
CANONICAL_DIR="$INPUTS_DIR/canonical_ll"

PUA_PATH="$INPUTS_DIR/programPUA.c"
OP_PATH="$INPUTS_DIR/programOP.c"
SIGMA_PATH="$INPUTS_DIR/sigma.txt"

MODE=""
IANALYZE=()
IANALYZEBOOL=0
IINSTRUMENT=()
IINSTRUMENTBOOL=0
AFLFUZZ=0
LOGFILE=""
POLICY=""
RENDER=1

print_usage() {
  echo "Usage: $0 -export|-run [options]"
  echo ""
  echo "Modes:"
  echo "  -export               (Mac) Run full analysis, save artifacts to inputs/canonical_ll/"
  echo "  -run                  (Linux) Restore artifacts, run Java + instrumentation only"
  echo ""
  echo "Input files:"
  echo "  -pua PATH             Path to PUA source"
  echo "  -op PATH              Path to OP source"
  echo "  -sigma PATH           Path to sigma pairing"
  echo ""
  echo "Include paths:"
  echo "  -Ianalyze D1 [D2 ...]     Include dirs for analyze step (Mac only)"
  echo "  -Iinstrument F1 [F2 ...]  Extra files to link at instrumentation (Linux)"
  echo ""
  echo "Instrumentation options:"
  echo "  -afl                  Compile with AFL++ for fuzzing"
  echo "  -log [PATH]           Enable monitor logging (default: /tmp/mm_monitor.log)"
  echo "  -policy POLICY        Monitor policy: stop-v, stop-iv, or n"
  echo "  -no-render            Skip PNG rendering"
  echo "  -h                    Show this help"
  exit 0
}

if [[ $# -eq 0 ]]; then print_usage; fi

case $1 in
  -export) MODE="export"; shift ;;
  -run)    MODE="run";    shift ;;
  -h)      print_usage ;;
  *)       echo -e "${RED}First argument must be -export or -run${RESET}"; print_usage ;;
esac

while [[ $# -gt 0 ]]; do
  case $1 in
    -pua)    PUA_PATH="$2"; shift 2 ;;
    -op)     OP_PATH="$2"; shift 2 ;;
    -sigma)  SIGMA_PATH="$2"; shift 2 ;;
    -Ianalyze)
      IANALYZEBOOL=1; shift
      while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do IANALYZE+=("$1"); shift; done ;;
    -Iinstrument)
      IINSTRUMENTBOOL=1; shift
      while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do IINSTRUMENT+=("$1"); shift; done ;;
    -afl)       AFLFUZZ=1; shift ;;
    -no-render) RENDER=0; shift ;;
    -log)
      shift
      if [[ $# -gt 0 && ! $1 =~ ^- ]]; then LOGFILE="$1"; shift
      else LOGFILE="/tmp/mm_monitor.log"; fi ;;
    -policy) POLICY="$2"; shift 2 ;;
    -h) print_usage ;;
    *) echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

echo -e "${CYAN}===== MIMICRY PORTABLE PIPELINE =====${RESET}"
echo -e "${YELLOW}Mode:    ${RESET}$MODE"
echo -e "${YELLOW}PUA:     ${RESET}$PUA_PATH"
echo -e "${YELLOW}OP:      ${RESET}$OP_PATH"
echo -e "${YELLOW}Sigma:   ${RESET}$SIGMA_PATH"
echo -e "${CYAN}=====================================${RESET}"

INSTRUMENT_FLAGS=()
[[ "$AFLFUZZ" == "1" ]]        && INSTRUMENT_FLAGS+=(-afl)
[[ -n "$LOGFILE" ]]             && INSTRUMENT_FLAGS+=(-log "$LOGFILE")
[[ -n "$POLICY" ]]              && INSTRUMENT_FLAGS+=(-policy "$POLICY")
[[ "$IINSTRUMENTBOOL" == "1" ]] && INSTRUMENT_FLAGS+=(-I "${IINSTRUMENT[@]}")

ANALYZE_FLAGS=(-pua "$PUA_PATH" -op "$OP_PATH" -sigma "$SIGMA_PATH")
[[ "$IANALYZEBOOL" == "1" ]] && ANALYZE_FLAGS+=(-I "${IANALYZE[@]}")
[[ "$RENDER" == "0" ]]        && ANALYZE_FLAGS+=(-no-render)

# ── EXPORT mode (Mac) ────────────────────────────────────────────────────────
if [[ "$MODE" == "export" ]]; then

  echo -e "${BLUE}Step 1:${RESET} Running full analysis (IR + def-use + CFG)..."
  cd "$SCRIPTS_DIR"
  ./analyze.sh "${ANALYZE_FLAGS[@]}"

  echo -e "${BLUE}Step 2:${RESET} Saving artifacts to canonical_ll/ for Linux..."
  mkdir -p "$CANONICAL_DIR"

  # LLVM IR (generated on Mac — used by Java and kept for reference)
  cp "$TEMPS_DIR/programPUA.ll"           "$CANONICAL_DIR/programPUA.ll"
  cp "$TEMPS_DIR/programOP.ll"            "$CANONICAL_DIR/programOP.ll"

  # def-use analysis outputs (needed by Java component)
  cp "$TEMPS_DIR/defUseOP.txt"            "$CANONICAL_DIR/defUseOP.txt"
  cp "$TEMPS_DIR/defUsePUA.txt"           "$CANONICAL_DIR/defUsePUA.txt"

  # CFG dot files (needed by Java component)
  cp "$CFGS_DIR/mainOP.dot"               "$CANONICAL_DIR/mainOP.dot"
  cp "$CFGS_DIR/mainPUA.dot"              "$CANONICAL_DIR/mainPUA.dot"

  echo -e "${GREEN}Saved to $CANONICAL_DIR:${RESET}"
  ls -1 "$CANONICAL_DIR" | grep -v ".gitkeep"

  echo ""
  echo -e "${CYAN}Next steps:${RESET}"
  echo "  git add llvm/feli/inputs/canonical_ll/"
  echo "  git commit -m 'Export Mac analysis artifacts for portable pipeline'"
  echo "  git push"
  echo ""
  echo -e "${CYAN}Then on Linux:${RESET}"
  echo "  ./run-portable.sh -run \\"
  echo "    -pua <linux-path-to-catPUA.c> \\"
  echo "    -op  <linux-path-to-catOP.c> \\"
  echo "    -sigma llvm/feli/inputs/otherInputs/catCU/catSigma.txt \\"
  echo "    -Iinstrument <linux-path-to-libcoreutils.a> <linux-path-to-version.o>"

# ── RUN mode (Linux) ─────────────────────────────────────────────────────────
elif [[ "$MODE" == "run" ]]; then

  # Verify all canonical artifacts exist
  MISSING=0
  for f in programPUA.ll programOP.ll defUseOP.txt defUsePUA.txt mainOP.dot mainPUA.dot; do
    if [ ! -f "$CANONICAL_DIR/$f" ]; then
      echo -e "${RED}Error: missing $CANONICAL_DIR/$f${RESET}"
      MISSING=1
    fi
  done
  if [ "$MISSING" = "1" ]; then
    echo "Run ./run-portable.sh -export on Mac first, then commit and push."
    exit 1
  fi

  echo -e "${BLUE}Step 1:${RESET} Restoring Mac analysis artifacts..."
  mkdir -p "$TEMPS_DIR" "$CFGS_DIR"

  cp "$CANONICAL_DIR/programPUA.ll"  "$TEMPS_DIR/programPUA.ll"
  cp "$CANONICAL_DIR/programOP.ll"   "$TEMPS_DIR/programOP.ll"
  cp "$CANONICAL_DIR/defUseOP.txt"   "$TEMPS_DIR/defUseOP.txt"
  cp "$CANONICAL_DIR/defUsePUA.txt"  "$TEMPS_DIR/defUsePUA.txt"
  cp "$CANONICAL_DIR/mainOP.dot"     "$CFGS_DIR/mainOP.dot"
  cp "$CANONICAL_DIR/mainPUA.dot"    "$CFGS_DIR/mainPUA.dot"

  echo -e "${GREEN}Artifacts restored to temps/ and cfgs/${RESET}"

  echo -e "${BLUE}Step 2:${RESET} Constructing Mimicry Monitor (Java)..."
  cd "$MIMICRY_DIR"
  JAVA_ARGS="$OP_PATH $PUA_PATH $SIGMA_PATH"
  [[ "$RENDER" == "0" ]] && JAVA_ARGS="$JAVA_ARGS --no-render"
  mvn exec:java \
    -Dexec.mainClass="org.example.Main" \
    -Dexec.args="$JAVA_ARGS"

  echo -e "${BLUE}Step 3:${RESET} Instrumenting PUA..."
  cd "$SCRIPTS_DIR"
  INSTRUMENT_RUN_FLAGS=("${INSTRUMENT_FLAGS[@]}" -pua "$PUA_PATH")
  [[ "$IANALYZEBOOL" == "1" ]] && INSTRUMENT_RUN_FLAGS+=(-Ic "${IANALYZE[@]}")
  ./instrument.sh "${INSTRUMENT_RUN_FLAGS[@]}"

  echo -e "${CYAN}===== PIPELINE COMPLETE =====${RESET}"
  echo -e "${YELLOW}Results: ${RESET}$OUTPUTS_DIR"
  echo -e "${PINK}
                ^~^  ,
               ('Y') )
               /   \/
              (\|||/) miau
${RESET}"
fi
