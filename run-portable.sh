#!/bin/bash

# Portable Mimicry pipeline.
#
# Two modes:
#   -export   (run on Mac) Generate .ll files from source, save them to
#             inputs/canonical_ll/ so they can be committed and used on Linux.
#
#   -run      (run on Linux) Copy the committed .ll files to temps/ and run
#             the full pipeline skipping IR generation.
#
# Usage:
#   ./run-portable.sh -export [pipeline options]
#   ./run-portable.sh -run   [pipeline options]

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
CANONICAL_LL_DIR="$INPUTS_DIR/canonical_ll"

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
  echo "  -export               (Mac) Generate .ll files and save to inputs/canonical_ll/"
  echo "  -run                  (Linux) Use saved .ll files, run full pipeline"
  echo ""
  echo "Input files:"
  echo "  -pua PATH             Path to PUA source (default: inputs/programPUA.c)"
  echo "  -op PATH              Path to OP source (default: inputs/programOP.c)"
  echo "  -sigma PATH           Path to sigma pairing (default: inputs/sigma.txt)"
  echo ""
  echo "Include paths:"
  echo "  -Ianalyze D1 [D2 ...]     Include dirs for analyze step"
  echo "  -Iinstrument F1 [F2 ...]  Extra files to link at instrumentation"
  echo ""
  echo "Instrumentation options:"
  echo "  -afl                  Compile with AFL++ for fuzzing"
  echo "  -log [PATH]           Enable monitor logging (default: /tmp/mm_monitor.log)"
  echo "  -policy POLICY        Monitor policy: stop-v, stop-iv, or n"
  echo "  -no-render            Skip PNG rendering"
  echo ""
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
[[ "$AFLFUZZ" == "1" ]]       && INSTRUMENT_FLAGS+=(-afl)
[[ -n "$LOGFILE" ]]            && INSTRUMENT_FLAGS+=(-log "$LOGFILE")
[[ -n "$POLICY" ]]             && INSTRUMENT_FLAGS+=(-policy "$POLICY")
[[ "$IINSTRUMENTBOOL" == "1" ]] && INSTRUMENT_FLAGS+=(-I "${IINSTRUMENT[@]}")

ANALYZE_FLAGS=(-pua "$PUA_PATH" -op "$OP_PATH" -sigma "$SIGMA_PATH")
[[ "$IANALYZEBOOL" == "1" ]] && ANALYZE_FLAGS+=(-I "${IANALYZE[@]}")
[[ "$RENDER" == "0" ]]        && ANALYZE_FLAGS+=(-no-render)

# ── EXPORT mode (Mac) ────────────────────────────────────────────────────────
if [[ "$MODE" == "export" ]]; then

  echo -e "${BLUE}Step 1:${RESET} Generating LLVM IR on this machine..."
  cd "$SCRIPTS_DIR"
  ./analyze.sh "${ANALYZE_FLAGS[@]}"

  echo -e "${BLUE}Step 2:${RESET} Saving .ll files to canonical_ll/ for Linux..."
  mkdir -p "$CANONICAL_LL_DIR"
  cp "$TEMPS_DIR/programPUA.ll" "$CANONICAL_LL_DIR/programPUA.ll"
  cp "$TEMPS_DIR/programOP.ll"  "$CANONICAL_LL_DIR/programOP.ll"
  echo -e "${GREEN}Saved:${RESET}"
  echo "  $CANONICAL_LL_DIR/programPUA.ll"
  echo "  $CANONICAL_LL_DIR/programOP.ll"

  echo ""
  echo -e "${CYAN}Next steps:${RESET}"
  echo "  git add llvm/feli/inputs/canonical_ll/"
  echo "  git commit -m 'Export Mac-generated .ll files for portable pipeline'"
  echo "  git push"
  echo "  Then on Linux: ./run-portable.sh -run [same options]"

# ── RUN mode (Linux) ─────────────────────────────────────────────────────────
elif [[ "$MODE" == "run" ]]; then

  echo -e "${BLUE}Step 1:${RESET} Copying canonical .ll files to temps/..."
  if [ ! -f "$CANONICAL_LL_DIR/programPUA.ll" ] || [ ! -f "$CANONICAL_LL_DIR/programOP.ll" ]; then
    echo -e "${RED}Error: canonical .ll files not found in $CANONICAL_LL_DIR${RESET}"
    echo "Run ./run-portable.sh -export on Mac first, then commit and push."
    exit 1
  fi
  cp "$CANONICAL_LL_DIR/programPUA.ll" "$TEMPS_DIR/programPUA.ll"
  cp "$CANONICAL_LL_DIR/programOP.ll"  "$TEMPS_DIR/programOP.ll"
  echo -e "${GREEN}Copied .ll files to $TEMPS_DIR${RESET}"

  echo -e "${BLUE}Step 2:${RESET} Running def-use analysis and CFG generation..."
  cd "$SCRIPTS_DIR"
  ./analyze.sh "${ANALYZE_FLAGS[@]}" -skip-ir

  echo -e "${BLUE}Step 3:${RESET} Constructing Mimicry Monitor..."
  cd "$MIMICRY_DIR"
  JAVA_ARGS="$OP_PATH $PUA_PATH $SIGMA_PATH"
  [[ "$RENDER" == "0" ]] && JAVA_ARGS="$JAVA_ARGS --no-render"
  mvn exec:java \
    -Dexec.mainClass="org.example.Main" \
    -Dexec.args="$JAVA_ARGS"

  echo -e "${BLUE}Step 4:${RESET} Instrumenting PUA..."
  cd "$SCRIPTS_DIR"
  ./instrument.sh "${INSTRUMENT_FLAGS[@]}"

  echo -e "${CYAN}===== PIPELINE COMPLETE =====${RESET}"
  echo -e "${YELLOW}Results: ${RESET}$OUTPUTS_DIR"
  echo -e "${PINK}
                ^~^  ,
               ('Y') )
               /   \/
              (\|||/) miau
${RESET}"
fi
