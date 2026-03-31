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
ILIBS=()

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
    *)
      echo -e "${RED}Unknown option: $1${RESET}"
      exit 1
      ;;
  esac
done

# Compile .c files in ILIBS to .o files
OBJECTS=()
for lib in "${ILIBS[@]}"; do
  if [[ "$lib" == *.c ]]; then
    obj="${lib%.c}.o"
    echo -e "${BLUE}Compiling${RESET} $lib → $obj"
    clang -c "$lib" /Users/felicitasgarcia/coreutils/lib/libcoreutils.a -o "$obj"
    if [ $? -ne 0 ]; then
      echo -e "${RED}Error:${RESET} Compilation of $lib failed!"
      exit 1
    fi
    OBJECTS+=("$obj")
  else
    OBJECTS+=("$lib")
  fi
done

# Detect the platform and set the correct extension
if [[ "$(uname)" == "Darwin" ]]; then
    PLUGIN_EXT="dylib"
else
    PLUGIN_EXT="so"
fi

PLUGIN_PATH="$BUILD_DIR/lib/LLVMMimicryPasses.$PLUGIN_EXT"

# Print header
echo -e "${CYAN}========== LLVM Mimicry Instrumentation Script ==========${RESET}"
echo -e "${YELLOW}Input file:     ${RESET}$INPUT_FILE"
echo -e "${YELLOW}Dot file:       ${RESET}$DOT_FILE"
echo -e "${YELLOW}Output file:    ${RESET}$OUTPUT_FILE"
echo -e "${YELLOW}Executable:     ${RESET}$EXECUTABLE_NAME"
echo -e "${CYAN}=================================================${RESET}"

# Optional: Ask if user wants to run the program immediately
echo -e "${YELLOW}Do you want the instrumented version to abort at IV, V, or not? (i/v/n): ${RESET}"
read -r policy
if [[ "$policy" == "i" || "$RUN_NOW" == "I" ]]; then
  POLICY="stop-iv"
elif [[ "$policy" == "v" || "$RUN_NOW" == "V" ]]; then
  POLICY="stop-v"
else
  POLICY="n"
fi

# Step 1: Run the instrumentation pass
echo -e "${BLUE}Step 1:${RESET} Running mimicry-instrument pass..."
$BUILD_DIR/bin/opt -load-pass-plugin=$PLUGIN_PATH -passes=mimicry-instrument -S "$INPUT_FILE" -dot-file="$DOT_FILE" -monitor-policy="$POLICY" -o "$OUTPUT_FILE"

# Check if the instrumentation was successful
if [ $? -ne 0 ]; then
  echo -e "${RED}Error:${RESET} Instrumentation failed!"
  exit 1
fi

# Step 1.1: sanitize debug pseudo-directives for compatibility across LLVM builds
# This does NOT change your LLVM version or analysis stage; it only cleans the generated instrumented IR.
if grep -qE '^[[:space:]]*#dbg_' "$OUTPUT_FILE"; then
  echo -e "${YELLOW}Sanitizing invalid debug pseudo-instructions (#dbg_*) in instrumented IR...${RESET}"
  tmp_output="${OUTPUT_FILE}.tmp"
  sed -E '/^[[:space:]]*#dbg_[a-zA-Z0-9_]*\(/d' "$OUTPUT_FILE" > "$tmp_output"
  mv "$tmp_output" "$OUTPUT_FILE"
fi

echo -e "${GREEN}Instrumentation completed successfully!${RESET}"
 
# Step 2: Compile the instrumented .ll file to executable
echo -e "${BLUE}Step 2:${RESET} Compiling instrumented code to executable..."

clang -S -emit-llvm ../passes/monitorAction.c -o ../passes/monitorAction.ll

if [ "$IBOOL" = "1" ]; then
    echo -e "${YELLOW}Including libraries in the instrumented LL compilation${RESET}"
    clang "$OUTPUT_FILE" ../passes/monitorAction.ll "${OBJECTS[@]}" -o "$EXECUTABLE_NAME"
else
    echo -e "${YELLOW}Not including libraries in the instrumented LL compilation${RESET}"
    clang "$OUTPUT_FILE" ../passes/monitorAction.c -o "$EXECUTABLE_NAME"
fi

# Check if compilation was successful
if [ $? -ne 0 ]; then
  echo -e "${RED}Error:${RESET} Compilation failed!"
  exit 1
fi

echo -e "${GREEN}Compilation completed successfully!${RESET}"
echo -e "${YELLOW}You can run the instrumented program with:${RESET} ./$EXECUTABLE_NAME"

# Optional: Ask if user wants to run the program immediately
echo -e "${YELLOW}Do you want to run the instrumented program now? (y/n): ${RESET}"
read -r RUN_NOW
if [[ "$RUN_NOW" == "y" || "$RUN_NOW" == "Y" ]]; then
  echo -e "${YELLOW}Input desired parameters for the instrumented program: ${RESET}"
  read -r params
  echo -e "${BLUE}Running instrumented program...${RESET}"
  ./"$EXECUTABLE_NAME" $params
fi
