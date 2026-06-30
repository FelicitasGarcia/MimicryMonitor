#!/bin/bash
#
# AFL++ fuzzing driver for MimicryMonitor.
#
# Targets:
#   instrumented (default) -> work/outputs/instrumentedPUA  (built by instrument.sh -afl)
#   -plain                 -> work/outputs/pua_plain         (compiled here from -pua source)
#
# Input delivery (how the mutated bytes reach the program), pick with -input:
#   argv  (default) -> bytes are passed as argv[1] via a small wrapper
#                      (suits the demo PUA: `pua <integer>`)
#   file            -> AFL writes the mutation to a file and passes its path (@@)
#                      (suits cat & co.: `cat [opts] @@`)
#   stdin           -> AFL feeds the mutation on stdin
#                      (suits cat & co.: `cat [opts]` reading stdin)
#
# Examples:
#   # demo PUA, plain, integer-on-argv (the original behavior)
#   pipeline/fuzz.sh -plain -i evaluation/seeds -t 60 -clean
#
#   # instrumented cat, file input, with -A; build it first via run-mimicry.sh -afl
#   pipeline/fuzz.sh -input file -targs "-A" -i evaluation/seeds-cat -t 60 -clean
#
#   # plain cat, stdin input
#   pipeline/fuzz.sh -plain -input stdin -targs "-A" \
#     -pua examples/catCU/catPUA.c \
#     -I /PATH/coreutils/src /PATH/coreutils/lib \
#     -link /PATH/coreutils/lib/libcoreutils.a /PATH/coreutils/src/version.o \
#     -i evaluation/seeds-cat -t 60 -clean

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
MODE="instrumented"                         # instrumented | plain
INPUT_MODE="argv"                           # argv | file | stdin
PUA_SRC="$MIMICRY_DIR/inputs/programPUA.c"  # plain-mode PUA source (override with -pua)
INCLUDE_DIRS=()                             # -I    : include dirs for the plain compile
LINK_FILES=()                               # -link : extra objects/libs to link
TARGET_ARGS=()                              # -targs: args passed to the program (file/stdin modes)
OUT_DIR=""
ASAN=0
GRAMMAR_SO=""                               # -grammar: path to libgrammarmutator-*.so
GRAMMAR_ONLY=0                              # -grammar-only: AFL_CUSTOM_MUTATOR_ONLY=1
TREES_DIR=""                                # -trees: pre-generated tree cache dir

print_usage() {
  cat <<EOF
Usage: $0 [options]

Target:
  -plain          Fuzz the plain PUA (no monitor); compiled here from -pua
  (default)       Fuzz work/outputs/instrumentedPUA (built by instrument.sh -afl)

Input delivery:
  -input MODE     argv (default) | file | stdin
                    argv  : mutated bytes as argv[1] (demo PUA)
                    file  : program reads the mutated file (@@)   -> cat [opts] @@
                    stdin : program reads stdin                   -> cat [opts]
  -targs "ARGS"   Arguments passed to the program in file/stdin modes (e.g. "-A")

Plain-compile options (only with -plain):
  -pua PATH       PUA source to compile (default: $PUA_SRC)
  -I DIR [DIR..]  Include dirs for the compile (e.g. coreutils headers)
  -link F [F..]   Extra objects/libraries to link (e.g. libcoreutils.a version.o)

Run options:
  -i DIR          Input seeds directory (default: $SEEDS_DIR)
  -o DIR          Output directory (default: auto per target)
  -t SECS         Stop after SECS seconds (default: run until Ctrl+C)
  -asan           Compile with AddressSanitizer (plain mode); for instrumented mode, rebuild with instrument.sh -asan
  -clean          Remove previous output before running
  -h              Show this help

Grammar Mutator (optional):
  -grammar LIB    Path to libgrammarmutator-*.so; sets AFL_CUSTOM_MUTATOR_LIBRARY
  -grammar-only   Also set AFL_CUSTOM_MUTATOR_ONLY=1 (suppress AFL's own mutations)
  -trees DIR      Pre-generated tree cache dir; copied to <out>/default/trees/ before fuzzing
EOF
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -plain)  MODE="plain"; shift ;;
    -input)  INPUT_MODE="$2"; shift 2 ;;
    -targs)  IFS=' ' read -r -a TARGET_ARGS <<< "$2"; shift 2 ;;
    -pua)    PUA_SRC="$2"; shift 2 ;;
    -I)      shift; while [[ $# -gt 0 && ! $1 =~ ^- ]]; do INCLUDE_DIRS+=("$1"); shift; done ;;
    -link)   shift; while [[ $# -gt 0 && ! $1 =~ ^- ]]; do LINK_FILES+=("$1"); shift; done ;;
    -i)      SEEDS_DIR="$2"; shift 2 ;;
    -o)      OUT_DIR="$2"; shift 2 ;;
    -t)      TIMEOUT="$2"; shift 2 ;;
    -asan)          ASAN=1; shift ;;
    -clean)         CLEAN=1; shift ;;
    -grammar)       GRAMMAR_SO="$2"; shift 2 ;;
    -grammar-only)  GRAMMAR_ONLY=1; shift ;;
    -trees)         TREES_DIR="$2"; shift 2 ;;
    -h)             print_usage ;;
    *)       echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

case "$INPUT_MODE" in
  argv|file|stdin) ;;
  *) echo -e "${RED}Invalid -input '$INPUT_MODE' (use argv|file|stdin)${RESET}"; exit 1 ;;
esac

# Resolve user-provided paths to absolute so the script works from any cwd.
to_abs() {
  [ -z "$1" ] && return 0
  if realpath -m -- "$1" 2>/dev/null; then :
  elif [ -e "$1" ] && command -v realpath >/dev/null 2>&1; then realpath -- "$1"
  else echo "$(cd "$(dirname -- "$1")" 2>/dev/null && pwd)/$(basename -- "$1")"; fi
}
SEEDS_DIR="$(to_abs "$SEEDS_DIR")"
[ -n "$OUT_DIR" ] && OUT_DIR="$(to_abs "$OUT_DIR")"
PUA_SRC="$(to_abs "$PUA_SRC")"
for i in "${!INCLUDE_DIRS[@]}"; do INCLUDE_DIRS[$i]="$(to_abs "${INCLUDE_DIRS[$i]}")"; done
for i in "${!LINK_FILES[@]}";   do LINK_FILES[$i]="$(to_abs "${LINK_FILES[$i]}")";     done
[ -n "$GRAMMAR_SO" ] && GRAMMAR_SO="$(to_abs "$GRAMMAR_SO")"
[ -n "$TREES_DIR"  ] && TREES_DIR="$(to_abs "$TREES_DIR")"

# --- Determine the target binary ---
if [[ "$MODE" == "plain" ]]; then
  TARGET="$MIMICRY_DIR/work/outputs/pua_plain"
  [[ -z "$OUT_DIR" ]] && OUT_DIR="$MIMICRY_DIR/work/afl_out_plain"
  WRAPPER="$MIMICRY_DIR/pipeline/afl_fuzz_wrapper_plain"
else
  TARGET="$MIMICRY_DIR/work/outputs/instrumentedPUA"
  [[ -z "$OUT_DIR" ]] && OUT_DIR="$MIMICRY_DIR/work/afl_out"
  WRAPPER="$MIMICRY_DIR/pipeline/afl_fuzz_wrapper"
  if [[ "$PUA_SRC" != "$MIMICRY_DIR/inputs/programPUA.c" || ${#INCLUDE_DIRS[@]} -gt 0 || ${#LINK_FILES[@]} -gt 0 ]]; then
    echo -e "${YELLOW}Note: -pua/-I/-link are ignored in instrumented mode (target is $TARGET).${RESET}"
  fi
fi

# --- Validate seeds ---
if [[ ! -d "$SEEDS_DIR" || -z "$(ls -A "$SEEDS_DIR")" ]]; then
  echo -e "${RED}Seeds directory empty or missing:${RESET} $SEEDS_DIR"
  exit 1
fi

# --- Validate grammar mutator options ---
if [[ -n "$GRAMMAR_SO" && ! -f "$GRAMMAR_SO" ]]; then
  echo -e "${RED}Grammar mutator .so not found:${RESET} $GRAMMAR_SO"; exit 1
fi
if [[ -n "$TREES_DIR" && ! -d "$TREES_DIR" ]]; then
  echo -e "${RED}Trees directory not found:${RESET} $TREES_DIR"; exit 1
fi

# --- Build the target binary (plain) or verify it exists (instrumented) ---
mkdir -p "$MIMICRY_DIR/work/outputs"
if [[ "$MODE" == "plain" ]]; then
  if ! command -v afl-clang-fast &>/dev/null; then
    echo -e "${RED}afl-clang-fast not found. Add AFL++ to PATH.${RESET}"; exit 1
  fi
  if [[ ! -f "$PUA_SRC" ]]; then
    echo -e "${RED}PUA source not found:${RESET} $PUA_SRC"; exit 1
  fi
  IFLAGS=()
  for d in "${INCLUDE_DIRS[@]}"; do IFLAGS+=("-I$d"); done
  ASANFLAGS=()
  if [[ "$ASAN" == "1" ]]; then
    export AFL_USE_ASAN=1
    ASANFLAGS+=("-fsanitize=address")
  fi
  echo -e "${YELLOW}Compiling plain PUA with afl-clang-fast:${RESET} $PUA_SRC${ASAN:+  [ASan enabled]}"
  afl-clang-fast "${IFLAGS[@]}" "${ASANFLAGS[@]}" "$PUA_SRC" "${LINK_FILES[@]}" -o "$TARGET"
  echo -e "${GREEN}Compiled:${RESET} $TARGET"
else
  if [[ ! -x "$TARGET" ]]; then
    echo -e "${RED}Instrumented target not found:${RESET} $TARGET"
    echo -e "${YELLOW}Build it first, e.g.:${RESET}"
    echo "  ./pipeline/run-mimicry.sh -afl -pua <pua.c> -op <op.c> -sigma <sigma> [-Ianalyze ...] [-Iinstrument ...]"
    exit 1
  fi
fi

# --- Build the afl-fuzz target command per input mode ---
RUN_TARGET=()   # what afl-fuzz runs after `--`
case "$INPUT_MODE" in
  argv)
    # The wrapper reads the @@ file and re-passes its content as argv[1].
    if ! command -v afl-clang-fast &>/dev/null; then
      echo -e "${RED}afl-clang-fast not found (needed to build the argv wrapper).${RESET}"; exit 1
    fi
    echo -e "${YELLOW}Compiling argv wrapper -> ${RESET}$WRAPPER"
    afl-clang-fast "$MIMICRY_DIR/pipeline/afl_fuzz_wrapper.c" \
      -DTARGET_BINARY="\"$TARGET\"" -o "$WRAPPER"
    [[ ${#TARGET_ARGS[@]} -gt 0 ]] && \
      echo -e "${YELLOW}Note: -targs are ignored in argv mode.${RESET}"
    RUN_TARGET=("$WRAPPER" @@)
    ;;
  file)
    RUN_TARGET=("$TARGET" "${TARGET_ARGS[@]}" @@)
    ;;
  stdin)
    RUN_TARGET=("$TARGET" "${TARGET_ARGS[@]}")
    ;;
esac

# --- Clean ---
if [[ "$CLEAN" == "1" ]]; then
  echo -e "${YELLOW}Removing previous output...${RESET}"
  rm -rf "$OUT_DIR"
fi

# --- Header ---
echo -e "${CYAN}========== AFL++ Fuzzing ==========${RESET}"
echo -e "${YELLOW}Target mode: ${RESET}$MODE"
echo -e "${YELLOW}Binary:      ${RESET}$TARGET"
echo -e "${YELLOW}Input mode:  ${RESET}$INPUT_MODE"
[[ "$INPUT_MODE" != "argv" && ${#TARGET_ARGS[@]} -gt 0 ]] && \
  echo -e "${YELLOW}Target args: ${RESET}${TARGET_ARGS[*]}"
echo -e "${YELLOW}ASan:        ${RESET}$([[ "$ASAN" == "1" ]] && echo "enabled" || echo "disabled")"
if [[ -n "$GRAMMAR_SO" ]]; then
  echo -e "${YELLOW}Grammar:     ${RESET}$GRAMMAR_SO"
  echo -e "${YELLOW}  only:      ${RESET}$([[ "$GRAMMAR_ONLY" == "1" ]] && echo "yes (AFL mutations suppressed)" || echo "no (combined with AFL mutations)")"
  [[ -n "$TREES_DIR" ]] && echo -e "${YELLOW}  trees:     ${RESET}$TREES_DIR"
fi
echo -e "${YELLOW}Seeds:       ${RESET}$SEEDS_DIR"
echo -e "${YELLOW}Output:      ${RESET}$OUT_DIR"
echo -e "${YELLOW}AFL cmd:     ${RESET}afl-fuzz -i SEEDS -o OUT -- ${RUN_TARGET[*]}"
[[ -n "$TIMEOUT" ]] && echo -e "${YELLOW}Timeout:     ${RESET}${TIMEOUT}s" \
                     || echo -e "${YELLOW}Timeout:     ${RESET}until Ctrl+C"
echo -e "${CYAN}==================================${RESET}"

export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
[[ "$ASAN" == "1" ]] && export AFL_USE_ASAN=1
if [[ -n "$GRAMMAR_SO" ]]; then
  export AFL_CUSTOM_MUTATOR_LIBRARY="$GRAMMAR_SO"
  [[ "$GRAMMAR_ONLY" == "1" ]] && export AFL_CUSTOM_MUTATOR_ONLY=1
  if [[ -n "$TREES_DIR" ]]; then
    mkdir -p "$OUT_DIR/default"
    cp -r "$TREES_DIR" "$OUT_DIR/default/trees"
    echo -e "${YELLOW}Copied tree cache -> ${RESET}$OUT_DIR/default/trees"
  fi
fi

cd "$MIMICRY_DIR"

if [[ -n "$TIMEOUT" ]]; then
  timeout "$TIMEOUT" afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "${RUN_TARGET[@]}" || true
else
  afl-fuzz -i "$SEEDS_DIR" -o "$OUT_DIR" -- "${RUN_TARGET[@]}"
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
  echo -e "${GREEN}Crashes saved: $N${RESET}  (in $CRASHES_DIR)"
else
  echo -e "${YELLOW}No crashes found.${RESET}"
fi
