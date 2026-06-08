#!/bin/bash
# Wrapper for AFL: read file passed as @@ and call instrumented binary with its content as argv[1]
set -euo pipefail
if [ "$#" -lt 1 ]; then
  exec llvm/feli/outputs/instrumentedPUA
fi
input_file="$1"
if [ ! -f "$input_file" ]; then
  exec llvm/feli/outputs/instrumentedPUA
fi
# Read whole file (trim newlines)
ARG=$(tr -d '\n' < "$input_file")
exec llvm/feli/outputs/instrumentedPUA "$ARG"
