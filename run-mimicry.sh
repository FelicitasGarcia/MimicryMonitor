#!/bin/bash

set -e

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PINK='\033[1;35m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Default paths
MIMICRY_DIR=$(pwd)
LLVM_DIR="$MIMICRY_DIR/llvm"
SCRIPTS_DIR="$LLVM_DIR/feli/scripts"
OUTPUTS_DIR="$LLVM_DIR/feli/outputs"
INPUTS_DIR="$LLVM_DIR/feli/inputs"
PUA_PATH="$INPUTS_DIR/programPUA.c"
OP_PATH="$INPUTS_DIR/programOP.c"
SIGMA_PATH="$INPUTS_DIR/sigma.txt"

IANALYZE=()
IANALYZEBOOL=0
IINSTRUMENT=()
IINSTRUMENTBOOL=0

# Flags que se propagan a instrument.sh
AFLFUZZ=0
LOGFILE=""
POLICY=""
RENDER=1

print_usage() {
  echo "Usage: $0 [options]"
  echo ""
  echo "Input files:"
  echo "  -pua PATH                 Path to PUA source (default: inputs/programPUA.c)"
  echo "  -op PATH                  Path to OP source (default: inputs/programOP.c)"
  echo "  -sigma PATH               Path to sigma pairing (default: inputs/sigma.txt)"
  echo ""
  echo "Include paths:"
  echo "  -Ianalyze D1 [D2 ...]     Include dirs for analyze step"
  echo "  -Iinstrument F1 [F2 ...]  Extra files to link at instrumentation"
  echo ""
  echo "Instrumentation options:"
  echo "  -afl                      Compile with AFL++ for fuzzing"
  echo "  -log [PATH]               Enable monitor logging (default: /tmp/mm_monitor.log)"
  echo "  -policy POLICY            Monitor policy: stop-v, stop-iv, or n"
  echo "  -no-render                Skip PNG rendering of all intermediate graphs"
  echo ""
  echo "  -h                        Show this help"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -pua)    PUA_PATH="$2"; shift 2 ;;
    -op)     OP_PATH="$2"; shift 2 ;;
    -sigma)  SIGMA_PATH="$2"; shift 2 ;;
      -Ianalyze)
      IANALYZEBOOL=1
      shift
      while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
        IANALYZE+=("$1")
        shift
      done
      ;;
    -Iinstrument)
      IINSTRUMENTBOOL=1
      shift
      while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
        IINSTRUMENT+=("$1")
        shift
      done
      ;;
    -afl)       AFLFUZZ=1; shift ;;
    -no-render) RENDER=0; shift ;;
    -log)
      shift
      if [[ $# -gt 0 && ! $1 =~ ^- ]]; then
        LOGFILE="$1"; shift
      else
        LOGFILE="/tmp/mm_monitor.log"
      fi
      ;;
    -policy) POLICY="$2"; shift 2 ;;
    -h) print_usage ;;
    *)
      echo -e "${RED}Unknown option: $1${RESET}"
      print_usage
      ;;
  esac
done

# --- Construir flags para instrument.sh ---
INSTRUMENT_FLAGS=()
[[ "$AFLFUZZ" == "1" ]]   && INSTRUMENT_FLAGS+=(-afl)
[[ -n "$LOGFILE" ]]        && INSTRUMENT_FLAGS+=(-log "$LOGFILE")
[[ -n "$POLICY" ]]         && INSTRUMENT_FLAGS+=(-policy "$POLICY")
[[ "$IINSTRUMENTBOOL" == "1" ]] && INSTRUMENT_FLAGS+=(-I "${IINSTRUMENT[@]}")

echo -e "${CYAN}===== MIMICRY ANALYSIS PIPELINE =====${RESET}"
echo -e "${YELLOW}PUA:     ${RESET}$PUA_PATH"
echo -e "${YELLOW}OP:      ${RESET}$OP_PATH"
echo -e "${YELLOW}Sigma:   ${RESET}$SIGMA_PATH"
[[ "$AFLFUZZ" == "1" ]]  && echo -e "${YELLOW}Mode:    ${RESET}AFL++ fuzzing"
[[ "$RENDER" == "0" ]]   && echo -e "${YELLOW}Render:  ${RESET}disabled"
echo -e "${CYAN}=====================================${RESET}"

# --- Step 1: Analyze ---
echo -e "${BLUE}Step 1:${RESET} Analyzing programs"
cd "$SCRIPTS_DIR"
ANALYZE_FLAGS=(-pua "$PUA_PATH" -op "$OP_PATH" -sigma "$SIGMA_PATH")
[[ "$IANALYZEBOOL" == "1" ]] && ANALYZE_FLAGS+=(-I "${IANALYZE[@]}")
[[ "$RENDER" == "0" ]]       && ANALYZE_FLAGS+=(-no-render)
./analyze.sh "${ANALYZE_FLAGS[@]}"

# --- Step 2: Monitor construction ---
echo -e "${BLUE}Step 2:${RESET} Constructing Mimicry Monitor"
cd "$MIMICRY_DIR"
JAVA_ARGS="$OP_PATH $PUA_PATH $SIGMA_PATH"
[[ "$RENDER" == "0" ]] && JAVA_ARGS="$JAVA_ARGS --no-render"
mvn exec:java \
  -Dexec.mainClass="org.example.Main" \
  -Dexec.args="$JAVA_ARGS"

# --- Step 3: Instrument ---
echo -e "${BLUE}Step 3:${RESET} Instrumenting PUA"
cd "$SCRIPTS_DIR"
./instrument.sh "${INSTRUMENT_FLAGS[@]}"

# --- Done ---
echo -e "${CYAN}===== PIPELINE COMPLETE =====${RESET}"
echo -e "${YELLOW}Results: ${RESET}$OUTPUTS_DIR"
echo -e "${PINK}
                  ^~^  ,
                 ('Y') )
                 /   \/
                (\|||/) miau
${RESET}"