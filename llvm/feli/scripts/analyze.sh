#!/bin/bash

set -e

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'
YELLOW='\033[1;33m'
RED='\033[1;31m'

# Paths configuration
MIMICRY_DIR="../../.."
LLVM_DIR="$MIMICRY_DIR/llvm"
INPUTS_DIR="$LLVM_DIR/feli/inputs"
TEMPS_DIR="$LLVM_DIR/feli/temps"
BUILD_DIR="$LLVM_DIR/llvm-project/build"
CFG_OUTPUT_DIR="$LLVM_DIR/feli/cfgs"
PUA_PATH="$INPUTS_DIR/programPUA.c"
OP_PATH="$INPUTS_DIR/programOP.c"
SIGMA_PATH="$INPUTS_DIR/sigma.txt"
IBOOL=0
ILIB=""

# Detect the platform and set the correct extension
if [[ "$(uname)" == "Darwin" ]]; then
    PLUGIN_EXT="dylib"
else
    PLUGIN_EXT="so"
fi

PLUGIN_PATH="$BUILD_DIR/lib/LLVMMimicryPasses.$PLUGIN_EXT"

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -pua PATH    Path to PUA program source (default: $PUA_PATH)"
  echo "  -op PATH     Path to OP program source (default: $OP_PATH)"
  echo "  -sigma PATH    Path to sigma pairing (default: $SIGMA_PATH)"
  echo "  -h           Show this help message"
  echo "  -I PATH       Path to include dir in the LL compilation (default: optnone)"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -pua) PUA_PATH="$2"; shift 2 ;;
    -op) OP_PATH="$2"; shift 2 ;;
    -sigma) SIGMA_PATH="$2"; shift 2 ;;
    -h) print_usage ;;
    -I) IBOOL=1;
           ILIB="$2";
           shift 2;;
    *) echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

PUA_BASENAME=$(basename "$PUA_PATH" .c)
OP_BASENAME=$(basename "$OP_PATH" .c)

mkdir -p "$LLVM_DIR"
mkdir -p "$CFG_OUTPUT_DIR"

echo -e "${CYAN}===== LLVM Analysis Script =====${RESET}"
echo -e "${YELLOW}PUA Program:${RESET} $PUA_PATH"
echo -e "${YELLOW}OP Program:${RESET} $OP_PATH"
echo -e "${YELLOW}Sigma Pairing:${RESET} $SIGMA_PATH"
echo -e "${YELLOW}Output Directory:${RESET} $LLVM_DIR"
echo -e "${YELLOW}Build Directory:${RESET} $BUILD_DIR"
echo -e "${CYAN}=================================================${RESET}"

echo -e "${BLUE}Step 1:${RESET} Generating LLVM IR files..."

if [ "$IBOOL" = "1" ]; then
    echo -e "${YELLOW}Including lib directory in the LL compilation${RESET}"
    clang -S -I"$ILIB" -Xclang -disable-O0-optnone -g -emit-llvm "$PUA_PATH" -o "$TEMPS_DIR/programPUA.ll"
    clang -S -I"$ILIB" -Xclang -disable-O0-optnone -g -emit-llvm "$OP_PATH" -o "$TEMPS_DIR/programOP.ll"
else
    echo -e "${YELLOW}Not including lib directory in the LL compilation${RESET}"
    clang -S -Xclang -disable-O0-optnone -g -emit-llvm "$PUA_PATH" -o "$TEMPS_DIR/programPUA.ll"
    clang -S -Xclang -disable-O0-optnone -g -emit-llvm "$OP_PATH" -o "$TEMPS_DIR/programOP.ll"
fi

echo -e "${BLUE}Step 2:${RESET} Generating alias analysis information..."
$BUILD_DIR/bin/opt -load-pass-plugin=$PLUGIN_PATH -passes=defuse -S -disable-output "$TEMPS_DIR/programOP.ll" 2> "$TEMPS_DIR/defUseOP.txt"
$BUILD_DIR/bin/opt -load-pass-plugin=$PLUGIN_PATH -passes=defuse -S -disable-output "$TEMPS_DIR/programPUA.ll" 2> "$TEMPS_DIR/defUsePUA.txt"

echo -e "${BLUE}Step 3:${RESET} Generating control flow graphs..."

process_cfg() {
    local program_name=$1
    local output_name=$2

    echo "Processing $program_name..."

    # Remove previous .dot files in current dir to avoid confusion
    find . -maxdepth 1 -name ".main.dot" -type f -delete

    # Generate new CFG
    $BUILD_DIR/bin/opt -passes=dot-cfg "$TEMPS_DIR/$program_name" -disable-output

    # Sleep briefly to ensure file system updates
    sleep 1

    # Find the generated dot file in the current directory
    TEMP_DOT=$(find . -maxdepth 1 -name ".main.dot" -type f | head -n 1)

    if [ -n "$TEMP_DOT" ]; then
        echo -e "${GREEN}Found CFG at: $TEMP_DOT${RESET}"
        cp "$TEMP_DOT" "$CFG_OUTPUT_DIR/$output_name.dot"
        dot -Tpng "$CFG_OUTPUT_DIR/$output_name.dot" -o "$CFG_OUTPUT_DIR/$output_name.png"
        echo -e "${GREEN}Saved CFG to $CFG_OUTPUT_DIR/$output_name.dot and $output_name.png${RESET}"

        # Delete from current directory
        rm "$TEMP_DOT"
    else
        echo "${RED}Warning: Could not find generated CFG for $program_name"
    fi
}

echo -e "${BLUE}Step 4: ${RESET}Retrieving CFGS: ${program_name}..."

process_cfg "programPUA.ll" "mainPUA"
process_cfg "programOP.ll" "mainOP"

echo -e "${BLUE}Step 5: ${RESET}Deleting temporary CFG files"
find . -maxdepth 1 -name "*.dot" -type f -delete



echo -e "${GREEN}Control flow graph generation completed.${RESET}"
echo -e "${CYAN}===== Analysis completed successfully =====${RESET}"
