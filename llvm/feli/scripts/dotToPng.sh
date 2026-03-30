# Remove previous .dot files in current dir to avoid confusion
find . -maxdepth 1 -name ".main.dot" -type f -delete

# Generate new CFG
../../llvm-project/build/bin/opt -passes=dot-cfg ../temps/instrumentedPUA.ll -disable-output

# Sleep briefly to ensure file system updates
sleep 1

# Find the generated dot file in the current directory
TEMP_DOT=$(find . -maxdepth 1 -name ".main.dot" -type f | head -n 1)

if [ -n "$TEMP_DOT" ]; then
    echo -e "${GREEN}Found CFG at: $TEMP_DOT${RESET}"
    cp "$TEMP_DOT" ../temps/prueba.dot
    dot -Tpng ../temps/prueba.dot -o ../temps/prueba.png
    echo -e "${GREEN}Saved CFG to ../temps"

    # Delete from current directory
    rm "$TEMP_DOT"
else
    echo "${RED}Warning: Could not find generated CFG for $program_name"
fi

echo -e "${BLUE}Step 4: ${RESET}Retrieving CFGS: ${program_name}..."

echo -e "${BLUE}Step 5: ${RESET}Deleting temporary CFG files"
find . -maxdepth 1 -name "*.dot" -type f -delete