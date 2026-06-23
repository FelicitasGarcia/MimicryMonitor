# Out-of-tree build for the Mimicry LLVM passes.
#
# Builds LLVMMimicryPasses.so against an existing LLVM 19 build/install WITHOUT
# rebuilding LLVM and without copying sources into the LLVM tree. Point it at the
# pinned submodule build to keep cross-machine reproducibility identical to the
# old in-tree build (same LLVM commit, same opt that loads the plugin):
#
#   cmake -S llvm/feli/passes -B llvm/feli/passes/build \
#         -DLLVM_DIR=<repo>/llvm/llvm-project/build/lib/cmake/llvm \
#         -DCMAKE_BUILD_TYPE=Release
#   cmake --build llvm/feli/passes/build
#
# Produces llvm/feli/passes/build/LLVMMimicryPasses.so. setup.sh copies it to
# build/lib/ where analyze.sh / instrument.sh expect it.
cmake_minimum_required(VERSION 3.13.4)
project(MimicryPasses C CXX)

find_package(LLVM REQUIRED CONFIG)
message(STATUS "Using LLVM ${LLVM_PACKAGE_VERSION} (${LLVM_DIR})")

include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
add_definitions(${LLVM_DEFINITIONS})

# Target name differs from the output name so it never collides with an
# imported LLVMMimicryPasses target (e.g. a stale in-tree build export).
add_library(MimicryPassesPlugin MODULE
  MimicryInstrument.cpp
  FeliDefUseInfo.cpp
)

set_target_properties(MimicryPassesPlugin PROPERTIES
  OUTPUT_NAME LLVMMimicryPasses
  PREFIX ""
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
  CXX_EXTENSIONS OFF)

# Match LLVM's RTTI setting to keep the plugin ABI-compatible with the opt that loads it.
if(NOT LLVM_ENABLE_RTTI)
  target_compile_options(MimicryPassesPlugin PRIVATE -fno-rtti)
endif()

# On macOS the linker requires all symbols to be resolved at link time, but LLVM
# symbols are provided by the opt binary that dlopen()s this plugin at runtime.
if(APPLE)
  target_link_options(MimicryPassesPlugin PRIVATE -undefined dynamic_lookup)
endif()
