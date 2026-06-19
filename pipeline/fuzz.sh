#!/bin/bash

set -e

GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

MIMICRY_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SEEDS_DIR="$MIMICRY_DIR/evaluation/seeds"
TIMEOUT=""
CLEAN=0
MODE="instrumented"  # instrumented | plain

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -plain       Fuzz plain PUA (no Mimicry monitor, AFL coverage only)"
  echo "  -i DIR       Input seeds directory (default: $SEEDS_DIR)"
  echo "  -o DIR       Output directory (default: auto per mode)"
  echo "  -t SECS      Stop after SECS seconds (default: run until Ctrl+C)"
  echo "  -clean       Remove previous output before running"
  echo "  -h           Show this help"
  exit 0
}

OUT_DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -plain)  MODE="plain"; shift ;;
    -i)      SEEDS_DIR="$2"; shift 2 ;;
    -o)      OUT_DIR="$2"; shift 2 ;;
    -t)      TIMEOUT="$2"; shift 2 ;;
    -clean)  CLEAN=1; shift ;;
    -h)      print_usage ;;
    *)       echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

# --- Set paths based on mode ---
if [[ "$MODE" == "plain" ]]; then
  PUA_PLAIN="$MIMICRY_DIR/work/outputs/pua_plain"
  WRAPPER="$MIMICRY_DIR/pipeline/afl_fuzz_wrapper_plain"
  [[ -z "$OUT_DIR" ]] && OUT_DIR="$MIMICRY_DIR/work/afl_out_plain"
else
  WRAPPER="$MIMICRY_DIR/pipeline/afl_fuzz_wrapper"
  [[ -z "$OUT_DIR" ]] && OUT_DIR="$MIMICRY_DIR/work/afl_out"
fi

# --- Validate seeds ---
if [[ ! -d "$SEEDS_DIR" || -z "$(ls -A "$SEEDS_DIR")" ]]; then
  echo -e "${RED}Seeds directory empty or missing:${RESET} $SEEDS_DIR"
  exit 1
fi

# --- Compile for plain mode ---
if [[ "$MODE" == "plain" ]]; then
  if ! command -v afl-clang-fast &>/dev/null; then
    echo -e "${RED}afl-clang-fast not found. Add AFL++ to PATH.${RESET}"
    exit 1
  fi

  PUA_SRC="$MIMICRY_DIR/inputs/programPUA.c"
  if [[ ! -f "$PUA_SRC" ]]; then
    echo -e "${RED}PUA source not found:${RESET} $PUA_SRC"
    exit 1
  fi

  echo -e "${YELLOW}Compiling plain PUA with afl-clang-fast...${RESET}"
  afl-clang-fast "$PUA_SRC" -o "$PUA_PLAIN"
  echo -e "${GREEN}Compiled:${RESET} $PUA_PLAIN"

  echo -e "${YELLOW}Compiling plain wrapper...${RESET}"
  afl-clang-fast "$MIMICRY_DIR/pipeline/afl_fuzz_wrapper.c" \
    -DTARGET_BINARY="\"$PUA_PLAIN\"" \
    -o "$WRAPPER"
  echo -e "${GREEN}Compiled:${RESET} $WRAPPER"
else
  if [[ ! -f "$WRAPPER" ]]; then
    echo -e "${RED}Wrapper not found:${RESET} $WRAPPER"
    echo -e "${YELLOW}Run instrument.sh -afl first, then recompile the wrapper:${RESET}"
    echo "  afl-clang-fast pipeline/afl_fuzz_wrapper.c -o pipeline/afl_fuzz_wrapper"
    exit 1
  fi
fi

# --- Clean ---
if [[ "$CLEAN" == "1" ]]; then
  echo -e "${YELLOW}Removing previous output...${RESET}"
  rm -rf "$OUT_DIR"
fi

# --- Header ---
echo -e "${CYAN}========== AFL++ Fuzzing ==========${RESET}"
echo -e "${YELLOW}Mode:    ${RESET}$MODE"
echo -e "${YELLOW}Seeds:   ${RESET}$SEEDS_DIR"
echo -e "${YELLOW}Output:  ${RESET}$OUT_DIR"
echo -e "${YELLOW}Wrapper: ${RESET}$WRAPPER"
[[ -n "$TIMEOUT" ]] && echo -e "${YELLOW}Timeout: ${RESET}${TIMEOUT}s" \
                     || echo -e "${YELLOW}Timeout: ${RESET}until Ctrl+C"
echo -e "${CYAN}==================================${RESET}"

export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1

cd "$MIMICRY_DIR"

if [[ -n "$TIMEOUT" ]]; then
  timeout "$TIMEOUT" afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "$WRAPPER" @@ || true
else
  afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "$WRAPPER" @@
fi

# --- Summary ---
echo -e "${CYAN}========== Results ==========${RESET}"
STATS="$OUT_DIR/default/fuzzer_stats"
if [[ -f "$STATS" ]]; then
  grep -E "execs_done|execs_per_sec|saved_crashes|corpus_found|bitmap_cvg" "$STATS"
fi

CRASHES_DIR="$OUT_DIR/default/crashes"
N=$(ls "$CRASHES_DIR"/id* 2>/dev/null | wc -l)
if [[ "$N" -gt 0 ]]; then
  echo -e "${GREEN}Crashes saved: $N${RESET}"
  for f in "$CRASHES_DIR"/id*; do
    echo -n "  $f: "; cat "$f"; echo
  done
else
  echo -e "${YELLOW}No crashes found.${RESET}"
fi
