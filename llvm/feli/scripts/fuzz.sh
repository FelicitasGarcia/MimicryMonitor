#!/bin/bash

set -e

GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

MIMICRY_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"
SEEDS_DIR="$MIMICRY_DIR/llvm/feli/afl_seeds"
OUT_DIR="$MIMICRY_DIR/llvm/feli/afl_out"
WRAPPER="$MIMICRY_DIR/llvm/feli/scripts/afl_fuzz_wrapper"
TIMEOUT=""

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -i DIR       Input seeds directory (default: $SEEDS_DIR)"
  echo "  -o DIR       Output directory (default: $OUT_DIR)"
  echo "  -t SECS      Stop after SECS seconds (default: run until Ctrl+C)"
  echo "  -clean       Remove previous output before running"
  echo "  -h           Show this help"
  exit 0
}

CLEAN=0

while [[ $# -gt 0 ]]; do
  case $1 in
    -i) SEEDS_DIR="$2"; shift 2 ;;
    -o) OUT_DIR="$2"; shift 2 ;;
    -t) TIMEOUT="$2"; shift 2 ;;
    -clean) CLEAN=1; shift ;;
    -h) print_usage ;;
    *) echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

if [[ ! -f "$WRAPPER" ]]; then
  echo -e "${RED}Wrapper not found:${RESET} $WRAPPER"
  echo -e "${YELLOW}Run instrument.sh -afl first, then recompile the wrapper:${RESET}"
  echo "  afl-clang-fast llvm/feli/scripts/afl_fuzz_wrapper.c -o llvm/feli/scripts/afl_fuzz_wrapper"
  exit 1
fi

if [[ ! -d "$SEEDS_DIR" || -z "$(ls -A "$SEEDS_DIR")" ]]; then
  echo -e "${RED}Seeds directory empty or missing:${RESET} $SEEDS_DIR"
  exit 1
fi

if [[ "$CLEAN" == "1" ]]; then
  echo -e "${YELLOW}Removing previous output...${RESET}"
  rm -rf "$OUT_DIR"
fi

echo -e "${CYAN}========== AFL++ Fuzzing ==========${RESET}"
echo -e "${YELLOW}Seeds:   ${RESET}$SEEDS_DIR"
echo -e "${YELLOW}Output:  ${RESET}$OUT_DIR"
echo -e "${YELLOW}Wrapper: ${RESET}$WRAPPER"
[[ -n "$TIMEOUT" ]] && echo -e "${YELLOW}Timeout: ${RESET}${TIMEOUT}s" || echo -e "${YELLOW}Timeout: ${RESET}until Ctrl+C"
echo -e "${CYAN}==================================${RESET}"

export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1

cd "$MIMICRY_DIR"

if [[ -n "$TIMEOUT" ]]; then
  timeout "$TIMEOUT" afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "$WRAPPER" @@ || true
else
  afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "$WRAPPER" @@
fi

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
