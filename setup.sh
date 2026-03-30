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

# Configuration
MIMICRY_DIR=$(pwd)
LLVM_DIR="$MIMICRY_DIR/llvm"
LLVM_PROJECT_DIR="$LLVM_DIR/llvm-project"
BUILD_DIR="$LLVM_PROJECT_DIR/build"
CUSTOM_PASSES_DIR="$LLVM_DIR/feli/passes"

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
if [ ! -d "$LLVM_PROJECT_DIR" ]; then
    echo -e "${BLUE}STEP 0: CLONING LLVM PROJECT${RESET}"
    print_info "This may take a while..."
    git clone --depth 1 https://github.com/llvm/llvm-project.git "$LLVM_PROJECT_DIR"
    cd "$LLVM_PROJECT_DIR"
    # Use a stable version of LLVM (adjust as needed)
else
    print_info "Using existing LLVM project at $LLVM_PROJECT_DIR"
fi

# Step 2: Copy custom pass files to LLVM
echo -e "${BLUE}STEP 1: INTEGRATING CUSTOM PASSES${RESET}"

# Create a directory for our custom passes
mkdir -p "$LLVM_PROJECT_DIR/llvm/lib/Transforms/Mimicry"
mkdir -p "$LLVM_PROJECT_DIR/llvm/include/llvm/Transforms/Mimicry"

# Copy all custom pass files
cp "$CUSTOM_PASSES_DIR"/*.cpp "$LLVM_PROJECT_DIR/llvm/lib/Transforms/Mimicry/"
cp "$CUSTOM_PASSES_DIR"/*.h "$LLVM_PROJECT_DIR/llvm/include/llvm/Transforms/Mimicry/" 2>/dev/null || true

# Create CMakeLists.txt for our custom pass
cat > "$LLVM_PROJECT_DIR/llvm/lib/Transforms/Mimicry/CMakeLists.txt" << EOF
add_llvm_library(LLVMMimicryPasses MODULE
  # List all your .cpp files here
  MimicryInstrument.cpp
  FeliDefUseInfo.cpp
  # Add any other pass files you have
  
  PLUGIN_TOOL
  opt
)
EOF

# Update the parent CMakeLists.txt to include our directory
if ! grep -q "add_subdirectory(Mimicry)" "$LLVM_PROJECT_DIR/llvm/lib/Transforms/CMakeLists.txt"; then
    echo "add_subdirectory(Mimicry)" >> "$LLVM_PROJECT_DIR/llvm/lib/Transforms/CMakeLists.txt"
fi

# Step 2: Build LLVM with our custom passes
echo -e "${BLUE}STEP 2: BUILDING LLVM WITH CUSTOM PASSES${RESET}"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# ==== CONFIGURE CMAKE ====
echo -e "${BLUE}STEP 3: CONFIGURING WITH CMAKE + NINJA${RESET}"
cmake -S "$LLVM_PROJECT_DIR/llvm" -B "$BUILD_DIR" -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \

cmake --build "$BUILD_DIR"

# Step 4: Copy scripts to the right location
echo -e "${BLUE}STEP 4: SETTING UP ANALYSIS SCRIPTS ${RESET}"
chmod +x "$LLVM_DIR/feli/scripts/analyze.sh"
chmod +x "$LLVM_DIR/feli/scripts/instrument.sh"
chmod +x "$MIMICRY_DIR/run-mimicry.sh"

echo -e "${BLUE}STEP 5: SETTING UP JAVA PROJECT${RESET}"
cd "$MIMICRY_DIR"
mvn clean package

echo -e "${YELLOW}SETUP COMPLETE"
print_success "The Mimicry project has been successfully set up!"
print_info "You can now run the full pipeline with: ./run-mimicry.sh"
print_info "Or run individual scripts:"
print_info "  - Analysis: $LLVM_DIR/feli/scripts/analyze.sh"
print_info "  - Instrumentation: $LLVM_DIR/feli/scripts/instrument.sh"
print_info "Do you want to run the full pipeline now? (y/n)"
read -r run_pipeline
if [[ $run_pipeline == "y" || $run_pipeline == "Y" ]]; then
    cd "$MIMICRY_DIR"
    ./run-mimicry.sh
else
    print_info "You can run the pipeline later by executing: ./run-mimicry.sh"
fi