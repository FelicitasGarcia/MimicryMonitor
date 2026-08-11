#!/bin/bash

set -e

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

MIMICRY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INPUT_FILE="$MIMICRY_DIR/work/temps/programPUA.ll"
DOT_FILE="$MIMICRY_DIR/work/outputs/monitor.dot"
OUTPUT_FILE="$MIMICRY_DIR/work/temps/instrumentedPUA.ll"
EXECUTABLE_NAME="$MIMICRY_DIR/work/outputs/instrumentedPUA"
LLVM_DIR="$MIMICRY_DIR/llvm"
BUILD_DIR="$LLVM_DIR/llvm-project/build"
PASSES_DIR="$MIMICRY_DIR/instrumentation"
mkdir -p "$MIMICRY_DIR/work/temps" "$MIMICRY_DIR/work/outputs"

IBOOL=0
AFLFUZZ=0
AFL_IV_FEEDBACK=0
AFL_IV_FEEDBACK_PATH=0
ASAN=0
LOGFILE=""
POLICY=""
ILIBS=()
PUA_PATH=""   # if set, generate IR locally before instrumenting
ICBOOL=0
ICDIRS=()
BIN_SUFFIX=""  # -bin-suffix: appended to output binary name (for parallel campaigns)

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -pua PATH          Path to PUA .c source — IR is generated locally (arch-agnostic)"
  echo "  -Ic DIR [DIR]      Include dirs for .c → IR compilation (used with -pua)"
  echo "  -afl               Enable and register AFL reporter"
  echo "  -afl-iv-feedback   With -afl: mark IV-reaching executions in AFL's own coverage map"
  echo "                     so afl-fuzz favors/energizes inputs that reach IV (opt-in)"
  echo "  -afl-iv-feedback-path  With -afl: path-sensitive variant of the above — favors inputs"
  echo "                     whose monitor path is novel *and* IV, not just 'reached IV at all'"
  echo "                     (mutually exclusive with -afl-iv-feedback)"
  echo "  -asan              Compile with AddressSanitizer (-fsanitize=address)"
  echo "  -log [PATH]        Enable and register log reporter (default: /tmp/mm_monitor.log)"
  echo "  -policy POLICY     Monitor policy: stop-v, stop-iv, or n (default: interactive prompt)"
  echo "  -I FILE1 [FILE2]   Extra libraries to link"
  echo "  -bin-suffix SUFFIX Append SUFFIX to the output binary name (e.g. _sleep)"
  echo "  -h                 Show this help message"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -pua) PUA_PATH="$2"; shift 2 ;;
    -bin-suffix) BIN_SUFFIX="$2"; shift 2 ;;
    -Ic)
      ICBOOL=1; shift
      while [[ $# -gt 0 && ! $1 =~ ^- ]]; do ICDIRS+=("$1"); shift; done ;;
    -I)
      IBOOL=1
      shift
      while [[ $# -gt 0 && ! $1 =~ ^- ]]; do
        ILIBS+=("$1")
        shift
      done
      ;;
    -afl)
      AFLFUZZ=1
      shift
      ;;
    -afl-iv-feedback)
      AFL_IV_FEEDBACK=1
      shift
      ;;
    -afl-iv-feedback-path)
      AFL_IV_FEEDBACK_PATH=1
      shift
      ;;
    -asan)
      ASAN=1
      shift
      ;;
    -log)
      shift
      if [[ $# -gt 0 && ! $1 =~ ^- ]]; then
        LOGFILE="$1"
        shift
      else
        LOGFILE="/tmp/mm_monitor.log"
      fi
      ;;
    -policy)
      shift
      POLICY="$1"
      shift
      ;;
    -h) print_usage ;;
    *)
      echo -e "${RED}Unknown option: $1${RESET}"
      print_usage
      ;;
  esac
done

# Resolve user-provided paths to absolute so the script works from any cwd.
to_abs() {
  [ -z "$1" ] && return 0
  if realpath -m -- "$1" 2>/dev/null; then :
  elif [ -e "$1" ] && command -v realpath >/dev/null 2>&1; then realpath -- "$1"
  else echo "$(cd "$(dirname -- "$1")" 2>/dev/null && pwd)/$(basename -- "$1")"; fi
}
[ -n "$PUA_PATH" ] && PUA_PATH="$(to_abs "$PUA_PATH")"
for i in "${!ILIBS[@]}";  do ILIBS[$i]="$(to_abs "${ILIBS[$i]}")";   done
for i in "${!ICDIRS[@]}"; do ICDIRS[$i]="$(to_abs "${ICDIRS[$i]}")"; done
[[ -n "$BIN_SUFFIX" ]] && EXECUTABLE_NAME="${EXECUTABLE_NAME}${BIN_SUFFIX}"

# --- Seleccionar compilador ---
if [[ "$AFLFUZZ" == "1" ]]; then
  AFL_SEARCH_PATHS=("" "/usr/local/bin" "$HOME/AFLplusplus" "$HOME/afl++" "/opt/aflplusplus")
  CC=""
  for p in "${AFL_SEARCH_PATHS[@]}"; do
    candidate="${p:+$p/}afl-clang-fast"
    if command -v "$candidate" &>/dev/null; then
      CC="$candidate"
      break
    fi
  done
  if [[ -z "$CC" ]]; then
    echo -e "${RED}Error:${RESET} afl-clang-fast not found."
    echo -e "${YELLOW}Tip:${RESET} export PATH=\$PATH:/path/to/AFLplusplus"
    exit 1
  fi
  echo -e "${GREEN}AFL++ found:${RESET} $CC"
else
  CC="clang"
fi

# --- Compilar dependencias extra ---
OBJECTS=()
for lib in "${ILIBS[@]}"; do
  if [[ "$lib" == *.c ]]; then
    obj="${lib%.c}.o"
    echo -e "${BLUE}Compiling${RESET} $lib → $obj"
    $CC -c "$lib" -o "$obj"
    if [ $? -ne 0 ]; then
      echo -e "${RED}Error:${RESET} Compilation of $lib failed!"
      exit 1
    fi
    OBJECTS+=("$obj")
  else
    OBJECTS+=("$lib")
  fi
done

PLUGIN_PATH="$BUILD_DIR/lib/LLVMMimicryPasses.so"

# --- Header ---
echo -e "${CYAN}========== LLVM Mimicry Instrumentation ==========${RESET}"
echo -e "${YELLOW}Input:     ${RESET}$INPUT_FILE"
echo -e "${YELLOW}Dot:       ${RESET}$DOT_FILE"
echo -e "${YELLOW}Output:    ${RESET}$OUTPUT_FILE"
echo -e "${YELLOW}Binary:    ${RESET}$EXECUTABLE_NAME"
echo -e "${YELLOW}Compiler:  ${RESET}$CC"
echo -e "${YELLOW}Log:       ${RESET}${LOGFILE:-stderr}"

# --- Policy: default to none if not specified ---
if [[ -z "$POLICY" ]]; then
  POLICY="n"
fi
echo -e "${YELLOW}Policy:    ${RESET}$POLICY"
echo -e "${YELLOW}ASan:      ${RESET}$([[ "$ASAN" == "1" ]] && echo "enabled" || echo "disabled")"
echo -e "${CYAN}==================================================${RESET}"

if [[ "$ASAN" == "1" ]]; then
  export AFL_USE_ASAN=1
fi

# --- Step 0: Generate IR from source (when -pua is given) ---
if [[ -n "$PUA_PATH" ]]; then
  echo -e "${BLUE}Step 0:${RESET} Generating LLVM IR from source (host target)..."
  if command -v clang-16 >/dev/null 2>&1; then
    CLANG_IR="clang-16"
  elif [ -x "$BUILD_DIR/bin/clang" ]; then
    CLANG_IR="$BUILD_DIR/bin/clang"
  elif command -v clang-19 >/dev/null 2>&1; then
    CLANG_IR="clang-19"
  else
    CLANG_IR="clang"
  fi
  echo -e "${YELLOW}Clang for IR: ${RESET}$CLANG_IR"
  ICFLAGS=()
  for d in "${ICDIRS[@]}"; do ICFLAGS+=("-I$d"); done
  "$CLANG_IR" -S "${ICFLAGS[@]}" -Xclang -disable-O0-optnone -g -emit-llvm "$PUA_PATH" -o "$INPUT_FILE"
  echo -e "${GREEN}IR generated: $INPUT_FILE${RESET}"
fi

# --- Step 1: Instrumentation pass ---
echo -e "${BLUE}Step 1:${RESET} Running mimicry-instrument pass..."
"$BUILD_DIR/bin/opt" \
  -load-pass-plugin="$PLUGIN_PATH" \
  -passes=mimicry-instrument \
  -S "$INPUT_FILE" \
  -dot-file="$DOT_FILE" \
  -monitor-policy="$POLICY" \
  -o "$OUTPUT_FILE"

# Sanitize debug pseudo-directives
if grep -qE '^[[:space:]]*#dbg_' "$OUTPUT_FILE"; then
  echo -e "${YELLOW}Sanitizing #dbg_* pseudo-instructions...${RESET}"
  tmp_output="${OUTPUT_FILE}.tmp"
  sed -E '/^[[:space:]]*#dbg_[a-zA-Z0-9_]*\(/d' "$OUTPUT_FILE" > "$tmp_output"
  mv "$tmp_output" "$OUTPUT_FILE"
fi

echo -e "${GREEN}Instrumentation completed.${RESET}"

# Apple clang (pre-19 upstream) doesn't support captures(none) in LLVM IR; strip it
if clang --version 2>&1 | grep -q "Apple clang"; then
  sed -i '' 's/ captures(none)//g' "$OUTPUT_FILE"
fi

# --- Step 2: Compile ---
echo -e "${BLUE}Step 2:${RESET} Compiling instrumented code..."

MONITOR_RUNTIME=(
  "$PASSES_DIR/monitor_runtime.c"
  "$PASSES_DIR/mm_verdict_reporter.c"
)

EXTRA_OBJECTS=()

CFLAGS=()

if [[ "$ASAN" == "1" ]]; then
  CFLAGS+=("-fsanitize=address")
fi

if [[ -n "$LOGFILE" ]]; then
  echo -e "${YELLOW}Logging → $LOGFILE${RESET}"
  CFLAGS+=("-DMM_ENABLE_LOG_REPORTER=1")
  CFLAGS+=("-DMM_LOG_FILE=\"$LOGFILE\"")
  MONITOR_RUNTIME+=("$PASSES_DIR/mm_log_reporter.c")
fi

if [[ "$AFL_IV_FEEDBACK" == "1" && "$AFL_IV_FEEDBACK_PATH" == "1" ]]; then
  echo -e "${RED}Error:${RESET} -afl-iv-feedback and -afl-iv-feedback-path are mutually exclusive — pick one"
  exit 1
fi

if [[ "$AFLFUZZ" == "1" ]]; then
  echo -e "${YELLOW}Including AFL++ reporter${RESET}"
  CFLAGS+=("-DMM_ENABLE_AFL_REPORTER=1")
  AFL_REPORTER_OBJ="$MIMICRY_DIR/work/temps/mm_afl_reporter.o"
  AFL_REPORTER_CFLAGS=()
  if [[ "$AFL_IV_FEEDBACK" == "1" ]]; then
    echo -e "${YELLOW}IV feedback:${RESET} enabled — marking IV-reaching executions in AFL's coverage map"
    AFL_REPORTER_CFLAGS+=("-DMM_ENABLE_AFL_IV_FEEDBACK=1")
  fi
  if [[ "$AFL_IV_FEEDBACK_PATH" == "1" ]]; then
    echo -e "${YELLOW}IV feedback:${RESET} enabled (path-aware) — favoring novel IV-bound monitor paths"
    AFL_REPORTER_CFLAGS+=("-DMM_ENABLE_AFL_IV_FEEDBACK_PATH=1")
  fi
  echo -e "${YELLOW}Compiling AFL reporter with clang (no AFL instrumentation):${RESET} $AFL_REPORTER_OBJ"
  clang "${AFL_REPORTER_CFLAGS[@]}" -c "$PASSES_DIR/mm_afl_reporter.c" -o "$AFL_REPORTER_OBJ"
  EXTRA_OBJECTS+=("$AFL_REPORTER_OBJ")
elif [[ "$AFL_IV_FEEDBACK" == "1" || "$AFL_IV_FEEDBACK_PATH" == "1" ]]; then
  echo -e "${RED}Warning:${RESET} -afl-iv-feedback/-afl-iv-feedback-path has no effect without -afl (ignored)"
fi

$CC "${CFLAGS[@]}" "$OUTPUT_FILE" "${MONITOR_RUNTIME[@]}" "${EXTRA_OBJECTS[@]}" "${OBJECTS[@]}" -o "$EXECUTABLE_NAME"

echo -e "${GREEN}Build complete: ${RESET}$EXECUTABLE_NAME"