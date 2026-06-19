#!/bin/bash

set -e  # Exit on any error

# Color definitions
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'
YELLOW='\033[1;33m'
RED='\033[1;31m'

# Print colorful messages
print_header() {
    echo -e "${CYAN}==== $1 ====${RESET}"
}

print_success() {
    echo -e "${GREEN}$1${RESET}"
}

print_error() {
    echo -e "${RED}$1${RESET}"
    exit 1
}

print_info() {
    echo -e "${YELLOW}$1${RESET}"
}

echo -e "\033[1;35m
▗▖  ▗▖▄ ▄▄▄▄  ▄ ▗▞▀▘ ▄▄▄ ▄   ▄ ▗▖  ▗▖ ▄▄▄  ▄▄▄▄  ▄    ■   ▄▄▄   ▄▄▄
▐▛▚▞▜▌▄ █ █ █ ▄ ▝▚▄▖█    █   █ ▐▛▚▞▜▌█   █ █   █ ▄ ▗▄▟▙▄▖█   █ █
▐▌  ▐▌█ █   █ █     █     ▀▀▀█ ▐▌  ▐▌▀▄▄▄▀ █   █ █   ▐▌  ▀▄▄▄▀ █
▐▌  ▐▌█       █          ▄   █ ▐▌  ▐▌            █   ▐▌
                          ▀▀▀                        ▐▌

\033[0m"

# Configuration (repo root resolved from this script's location)
MIMICRY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LLVM_DIR="$MIMICRY_DIR/llvm"
LLVM_PROJECT_DIR="$LLVM_DIR/llvm-project"
BUILD_DIR="$LLVM_PROJECT_DIR/build"
CUSTOM_PASSES_DIR="$MIMICRY_DIR/instrumentation"
LLVM_SOURCE_DIR=""
LLVM_VERSION_TAG="llvmorg-19.1.7"
CC_COMPILER="${CC:-clang}"
CXX_COMPILER="${CXX:-clang++}"

# Parse command line options
while [[ $# -gt 0 ]]; do
  case $1 in
    -llvm)
      LLVM_PROJECT_DIR="$2"
      BUILD_DIR="$LLVM_PROJECT_DIR/build"
      shift 2
      ;;
    -b|-build)
      BUILD_DIR="$2"
      shift 2
      ;;
    -h|-help)
      echo "Usage: $0 [options]"
      echo "Options:"
      echo "  -llvm PATH    Path to existing llvm-project directory (default: $LLVM_PROJECT_DIR)"
      echo "  -b PATH       Build directory (default: $BUILD_DIR)"
      echo "  -h            Show this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use -h for help"
      exit 1
      ;;
  esac
done

print_header "MIMICRY PROJECT SETUP"
echo -e "${YELLOW}MIMICRY_DIR: ${RESET}$MIMICRY_DIR"
echo -e "${YELLOW}LLVM_DIR: ${RESET}$LLVM_DIR"
echo -e "${YELLOW}LLVM_PROJECT_DIR: ${RESET}$LLVM_PROJECT_DIR"
echo -e "${YELLOW}BUILD_DIR: ${RESET}$BUILD_DIR"
echo -e "${CYAN}=================================================${RESET}"

# Step 1: Clone LLVM if not already present
if [ -d "$LLVM_PROJECT_DIR" ] && [ ! -f "$LLVM_PROJECT_DIR/llvm/CMakeLists.txt" ]; then
  BACKUP_DIR="${LLVM_PROJECT_DIR}_backup_$(date +%Y%m%d_%H%M%S)"
  print_info "Existing directory at $LLVM_PROJECT_DIR does not contain full LLVM sources."
  print_info "Moving it to: $BACKUP_DIR"
  mv "$LLVM_PROJECT_DIR" "$BACKUP_DIR"
fi

if [ ! -d "$LLVM_PROJECT_DIR" ]; then
  echo -e "${BLUE}STEP 0: CLONING LLVM PROJECT${RESET}"
  print_info "This may take a while..."
  git clone --branch "$LLVM_VERSION_TAG" --depth 1 https://github.com/llvm/llvm-project.git "$LLVM_PROJECT_DIR"
else
  print_info "Using existing LLVM project at $LLVM_PROJECT_DIR"
fi

if [ -d "$LLVM_PROJECT_DIR/.git" ]; then
  print_info "Checking out LLVM version $LLVM_VERSION_TAG"
  git -C "$LLVM_PROJECT_DIR" fetch --depth 1 origin "tag/$LLVM_VERSION_TAG:$LLVM_VERSION_TAG" >/dev/null 2>&1 || true
  git -C "$LLVM_PROJECT_DIR" checkout -q "$LLVM_VERSION_TAG"
fi

LLVM_SOURCE_DIR="$LLVM_PROJECT_DIR/llvm"
if [ ! -f "$LLVM_SOURCE_DIR/CMakeLists.txt" ]; then
  print_error "LLVM source directory is invalid: $LLVM_SOURCE_DIR (missing CMakeLists.txt)"
fi

if ! command -v "$CC_COMPILER" >/dev/null 2>&1; then
  print_error "C compiler not found: $CC_COMPILER"
fi

if ! command -v "$CXX_COMPILER" >/dev/null 2>&1; then
  print_error "C++ compiler not found: $CXX_COMPILER"
fi

# Ensure clang-19 is available for analyze.sh (must match LLVM opt version)
if [[ "$(uname)" != "Darwin" ]]; then
  if ! command -v clang-19 >/dev/null 2>&1; then
    echo -e "${BLUE}Installing clang-19 to match LLVM opt version...${RESET}"
    sudo apt-get install -y clang-19
    print_success "clang-19 installed."
  else
    print_info "clang-19 already installed: $(clang-19 --version | head -1)"
  fi
fi

# Step 2: Build LLVM (vanilla — the Mimicry passes are built out-of-tree below)
echo -e "${BLUE}STEP 1: BUILDING LLVM${RESET}"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# ==== CONFIGURE CMAKE ====
echo -e "${BLUE}STEP 2: CONFIGURING WITH CMAKE + NINJA${RESET}"
cmake -S "$LLVM_SOURCE_DIR" -B "$BUILD_DIR" -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER="$CC_COMPILER" \
  -DCMAKE_CXX_COMPILER="$CXX_COMPILER" \
  -DLLVM_INCLUDE_TESTS=OFF

# Build tablegen and generated headers first to avoid first-build ordering issues.
cmake --build "$BUILD_DIR" --target llvm-tblgen include/llvm/IR/intrinsics_gen include/llvm/IR/Attributes.inc

cmake --build "$BUILD_DIR"

# Step 3: Build the Mimicry passes out-of-tree against the LLVM we just built.
# This keeps the pinned LLVM (reproducible) but avoids rebuilding LLVM and avoids
# copying sources into the LLVM tree. The plugin is placed where the pipeline
# scripts expect it ($BUILD_DIR/lib/LLVMMimicryPasses.so).
echo -e "${BLUE}STEP 3: BUILDING MIMICRY PASSES (out-of-tree)${RESET}"
cmake -S "$CUSTOM_PASSES_DIR" -B "$CUSTOM_PASSES_DIR/build" \
  -DLLVM_DIR="$BUILD_DIR/lib/cmake/llvm" \
  -DCMAKE_CXX_COMPILER="$CXX_COMPILER" \
  -DCMAKE_BUILD_TYPE=Release
cmake --build "$CUSTOM_PASSES_DIR/build"
cp "$CUSTOM_PASSES_DIR/build/LLVMMimicryPasses.so" "$BUILD_DIR/lib/LLVMMimicryPasses.so"
print_success "Mimicry plugin built: $BUILD_DIR/lib/LLVMMimicryPasses.so"

# Step 4: Make pipeline scripts executable
echo -e "${BLUE}STEP 4: SETTING UP ANALYSIS SCRIPTS ${RESET}"
chmod +x "$MIMICRY_DIR/pipeline/analyze.sh"
chmod +x "$MIMICRY_DIR/pipeline/instrument.sh"
chmod +x "$MIMICRY_DIR/pipeline/run-mimicry.sh"

echo -e "${BLUE}STEP 5: SETTING UP JAVA PROJECT${RESET}"
cd "$MIMICRY_DIR"

if ! command -v java >/dev/null 2>&1; then
  print_error "Java not found. Install JDK 22 (or adjust pom.xml to your installed Java version)."
fi

JAVA_VERSION_RAW=$(java -version 2>&1 | head -n 1)
JAVA_MAJOR=$(echo "$JAVA_VERSION_RAW" | sed -E 's/.*version "([0-9]+).*/\1/')
if [ "$JAVA_MAJOR" != "22" ]; then
  print_error "Java 22 is required. Detected: $JAVA_VERSION_RAW"
fi

if ! command -v mvn >/dev/null 2>&1; then
  print_error "Maven not found. Install Maven and re-run setup."
fi

mvn -f "$MIMICRY_DIR/monitor/pom.xml" clean package

echo -e "${YELLOW}SETUP COMPLETE"
print_success "The Mimicry project has been successfully set up!"
print_info "You can now run the full pipeline with: ./pipeline/run-mimicry.sh"
print_info "Or run individual scripts:"
print_info "  - Analysis: $MIMICRY_DIR/pipeline/analyze.sh"
print_info "  - Instrumentation: $MIMICRY_DIR/pipeline/instrument.sh"
print_info "Do you want to run the full pipeline now? (y/n)"
read -r run_pipeline
if [[ $run_pipeline == "y" || $run_pipeline == "Y" ]]; then
    "$MIMICRY_DIR/pipeline/run-mimicry.sh"
else
    print_info "You can run the pipeline later by executing: ./pipeline/run-mimicry.sh"
fi