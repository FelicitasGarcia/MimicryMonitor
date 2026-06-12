#!/bin/bash

set -e

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

MIMICRY_DIR="../../.."
INPUT_FILE="$MIMICRY_DIR/llvm/feli/temps/programPUA.ll"
DOT_FILE="$MIMICRY_DIR/llvm/feli/outputs/monitor.dot"
OUTPUT_FILE="$MIMICRY_DIR/llvm/feli/temps/instrumentedPUA.ll"
EXECUTABLE_NAME="$MIMICRY_DIR/llvm/feli/outputs/instrumentedPUA"
LLVM_DIR="$MIMICRY_DIR/llvm"
BUILD_DIR="$LLVM_DIR/llvm-project/build"

IBOOL=0
AFLFUZZ=0
LOGFILE=""
POLICY=""
ILIBS=()

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -afl               Enable and register AFL reporter"
  echo "  -log [PATH]        Enable and register log reporter (default: /tmp/mm_monitor.log)"
  echo "  -policy POLICY     Monitor policy: stop-v, stop-iv, or n (default: interactive prompt)"
  echo "  -I FILE1 [FILE2]   Extra libraries to link"
  echo "  -h                 Show this help message"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
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

# --- Detectar plugin ---
if [[ "$(uname)" == "Darwin" ]]; then
    PLUGIN_EXT="dylib"
else
    PLUGIN_EXT="so"
fi
PLUGIN_PATH="$BUILD_DIR/lib/LLVMMimicryPasses.$PLUGIN_EXT"

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
echo -e "${CYAN}==================================================${RESET}"

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

# --- Step 2: Compile ---
echo -e "${BLUE}Step 2:${RESET} Compiling instrumented code..."

MONITOR_RUNTIME=(
  ../passes/monitor_runtime.c
  ../passes/mm_verdict_reporter.c
)

EXTRA_OBJECTS=()

CFLAGS=()

if [[ -n "$LOGFILE" ]]; then
  echo -e "${YELLOW}Logging → $LOGFILE${RESET}"
  CFLAGS+=("-DMM_ENABLE_LOG_REPORTER=1")
  CFLAGS+=("-DMM_LOG_FILE=\"$LOGFILE\"")
  MONITOR_RUNTIME+=(../passes/mm_log_reporter.c)
fi

if [[ "$AFLFUZZ" == "1" ]]; then
  echo -e "${YELLOW}Including AFL++ reporter${RESET}"
  CFLAGS+=("-DMM_ENABLE_AFL_REPORTER=1")
  AFL_REPORTER_OBJ="../temps/mm_afl_reporter.o"
  echo -e "${YELLOW}Compiling AFL reporter with clang (no AFL instrumentation):${RESET} $AFL_REPORTER_OBJ"
  clang -c ../passes/mm_afl_reporter.c -o "$AFL_REPORTER_OBJ"
  EXTRA_OBJECTS+=("$AFL_REPORTER_OBJ")
fi

$CC "${CFLAGS[@]}" "$OUTPUT_FILE" "${MONITOR_RUNTIME[@]}" "${EXTRA_OBJECTS[@]}" "${OBJECTS[@]}" -o "$EXECUTABLE_NAME"

echo -e "${GREEN}Build complete: ${RESET}$EXECUTABLE_NAME"