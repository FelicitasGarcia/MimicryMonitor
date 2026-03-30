#!/bin/bash

set -e

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PINK='\033[1;35m'
RESET='\033[0m'
YELLOW='\033[1;33m'
RED='\033[1;31m'

# Define static paths
MIMICRY_DIR=$(pwd)
LLVM_DIR="$MIMICRY_DIR/llvm"
SCRIPTS_DIR="$LLVM_DIR/feli/scripts"
OUTPUTS_DIR="$LLVM_DIR/feli/outputs"
INPUTS_DIR="$LLVM_DIR/feli/inputs"
PUA_PATH="$INPUTS_DIR/programPUA.c"
OP_PATH="$INPUTS_DIR/programOP.c"
SIGMA_PATH="$INPUTS_DIR/sigma.txt"
IANALYZE=""
IANALYZEBOOL=0
IINSTRUMENT=()
IINSTRUMENTBOOL=0

print_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -pua PATH          Path to PUA program source (default: $PUA_PATH)"
  echo "  -op PATH           Path to OP program source (default: $OP_PATH)"
  echo "  -sigma PATH        Path to sigma pairing (default: $SIGMA_PATH)"
  echo "  -Ianalyze PATH     Path to include directory in the input LL compilation (default: none)"
  echo "  -Iinstrument PATH1 [PATH2] [PATH3] ...  Multiple include paths for instrumented LL compilation"
  echo "  -h                 Show this help message"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -pua) PUA_PATH="$2"; shift 2 ;;
    -op) OP_PATH="$2"; shift 2 ;;
    -sigma) SIGMA_PATH="$2"; shift 2 ;;
    -h) print_usage ;;
    -Ianalyze) IANALYZEBOOL=1;
        IANALYZE="$2"; shift 2;;
    -Iinstrument)
        IINSTRUMENTBOOL=1
        shift
        # Collect all arguments until the next option (starting with -)
        while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
            IINSTRUMENT+=("$1")
            shift
        done
        ;;
    *) echo -e "${RED}Unknown option: $1${RESET}"; print_usage ;;
  esac
done

echo -e "${CYAN}===== MIMICRY ANALYSIS PIPELINE =====${RESET}"

echo -e "${BLUE}Step 1: ${RESET}Analyzing programs"
cd "$SCRIPTS_DIR"
if [ "$IANALYZEBOOL" = "1" ]; then
    ./analyze.sh -pua "$PUA_PATH" -op "$OP_PATH" -sigma "$SIGMA_PATH" -I "$IANALYZE"
else
    ./analyze.sh -pua "$PUA_PATH" -op "$OP_PATH" -sigma "$SIGMA_PATH"
fi

echo -e "${BLUE}Step 2: ${RESET}Construction of MM"

echo -e "${CYAN}===== MONITOR CONSTRUCTION =====${RESET}"

cd "$MIMICRY_DIR"

# Step 2.1: Run the main class
MAIN_CLASS="org.example.Main"
mvn exec:java -Dexec.mainClass="$MAIN_CLASS" -Dexec.args="$OP_PATH $PUA_PATH $SIGMA_PATH"

echo -e "${CYAN}========================${RESET}"

echo -e "${BLUE}Step 3:${RESET} Instrumenting PUA program"
cd "$SCRIPTS_DIR"
if [ "$IINSTRUMENTBOOL" = "1" ]; then
    # Use eval to properly handle the multiple arguments with spaces
    eval ./instrument.sh -I "${IINSTRUMENT[@]}"
else
    ./instrument.sh
fi

echo -e "${CYAN}===== PIPELINE COMPLETE =====${RESET}"
echo -e "${YELLOW}Results are available in $OUTPUTS_DIR${RESET}"
echo -e "${PINK}
                  ^~^  ,
                 ('Y') )
                 /   \/
                (\|||/) miau
${RESET}"