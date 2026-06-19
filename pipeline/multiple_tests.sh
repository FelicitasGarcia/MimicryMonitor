#!/bin/bash

# Check arguments
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <test_folder> [results_file_name]"
    exit 1
fi

TEST_DIR=$(basename "$1")
ORIGINAL_DIR=$(dirname "$(pwd)")
PARENT_DIR=$(dirname "$(realpath "$1")")
OUTPUT_DIR="$ORIGINAL_DIR/outputs"
MONITOR_OUTPUT="/Users/felicitasgarcia/monitor_output.txt"

# If a second argument is provided, use it as filename
if [ "$#" -eq 2 ]; then
    RESULTS_FILE="$OUTPUT_DIR/$2"
else
    # If not, use default name based on test directory
    RESULTS_FILE="$OUTPUT_DIR/results_$TEST_DIR.txt"
fi

# Ensure output directory exists
mkdir -p "$PARENT_DIR/$OUTPUT_DIR"

# Change to parent directory of test folder
cd "$PARENT_DIR" || {
    echo "Cannot change to directory: $PARENT_DIR"
    exit 3
}

# Verify test directory exists
if [ ! -d "$TEST_DIR" ]; then
    echo "Invalid directory: $TEST_DIR"
    cd "$ORIGINAL_DIR"
    exit 2
fi

# Function to extract verdicts from individual execution
extract_verdict_from_execution() {
    local execution_text="$1"
    local verdict=""
    local verdict_type=""

    # Look for early abort first (most specific)
    if echo "$execution_text" | grep -q "EARLY ABORT"; then
        # Look for patterns like "EARLY ABORT: Policy 'stop-iv' triggered on verdict 'IV'"
        verdict=$(echo "$execution_text" | grep -E "EARLY ABORT.*verdict '[IV]+'" | tail -1 | sed -n "s/.*verdict '\([IV]*\)'.*/\1/p")
        if [ -n "$verdict" ]; then
            verdict_type="Early Abort"
        fi
    fi

    # If no early abort, look for final verdict
    if [ -z "$verdict" ]; then
        # Look for "Final verdict: IV" or "Final verdict: V"
        verdict=$(echo "$execution_text" | grep -E "Final verdict: [IV]+" | tail -1 | sed -n "s/.*Final verdict: \([IV]*\).*/\1/p")
        if [ -n "$verdict" ]; then
            verdict_type="Final"
        fi
    fi

    # If still no verdict, look for other verdict patterns
    if [ -z "$verdict" ]; then
        # Look for "Terminal state reached: IV" or similar
        verdict=$(echo "$execution_text" | grep -E "Terminal state reached: [IV]+" | tail -1 | sed -n "s/.*Terminal state reached: \([IV]*\).*/\1/p")
        if [ -n "$verdict" ]; then
            verdict_type="Terminal"
        fi
    fi

    # If still no verdict, look for "Initial state ... is terminal with verdict: ..."
    if [ -z "$verdict" ]; then
        verdict=$(echo "$execution_text" | grep -E "is terminal with verdict: [IV]+" | tail -1 | sed -n "s/.*is terminal with verdict: \([IV]*\).*/\1/p")
        if [ -n "$verdict" ]; then
            verdict_type="Initial Terminal"
        fi
    fi

    # If no verdict found, check other states
    if [ -z "$verdict" ]; then
        if echo "$execution_text" | grep -q "Monitoring completed normally"; then
            echo "Completed"
        elif echo "$execution_text" | grep -q "No valid transition.*from state"; then
            echo "Error-Transition"
        elif echo "$execution_text" | grep -q "Monitoring stopped due to invalid transition"; then
            echo "Error-Invalid"
        elif echo "$execution_text" | grep -q "Program terminating due to policy violation"; then
            echo "Policy-Violation"
        else
            echo "No-Terminal-Verdict"
        fi
    else
        echo "$verdict_type:$verdict"
    fi
}

# Clean results file
echo "Test Results for Program: $TEST_DIR" > "$RESULTS_FILE"
echo "========================================" >> "$RESULTS_FILE"

# Loop through each file in the folder
for test_file in "$TEST_DIR"/*.sh; do
    # Only regular files (not directories)
    if [[ -f "$test_file" ]]; then
        test_name=$(basename "$test_file")
        echo -n "Running $test_name ... "

        # Clean monitor file before running each test
        if [ -f "$MONITOR_OUTPUT" ]; then
            > "$MONITOR_OUTPUT"
        fi

        # Execute test through make check
        make check TESTS="$test_file"
        code=$?

        case $code in
            0)  result="OK" ;;
            1)  result="FAIL" ;;
            77) result="SKIP" ;;
            99) result="FATAL" ;;
            *)  result="UNKNOWN ($code)" ;;
        esac

        echo "$result"

        # Write test script name
        printf "\n%-30s %s\n" "$test_name" "$result" >> "$RESULTS_FILE"
        echo "----------------------------------------" >> "$RESULTS_FILE"

        # Analyze monitor file for individual cases
        if [ -f "$MONITOR_OUTPUT" ] && [ -s "$MONITOR_OUTPUT" ]; then
            # Use simple approach: split by separator lines
            case_num=0

            # Create temporary file to process each execution
            temp_file=$(mktemp)

            # Split file into sections by each "NEW EXECUTION"
            grep -n "NEW EXECUTION" "$MONITOR_OUTPUT" > "$temp_file.lines" 2>/dev/null || echo "" > "$temp_file.lines"

            if [ -s "$temp_file.lines" ]; then
                # Multiple executions
                while IFS=':' read -r line_num line_content; do
                    case_num=$((case_num + 1))

                    # Find next NEW EXECUTION line or end of file
                    next_line=$(awk -v current="$line_num" 'NR > 1 && $0 ~ /NEW EXECUTION/ && NR > current {print NR; exit}' "$MONITOR_OUTPUT")

                    if [ -n "$next_line" ]; then
                        # Extract from line_num to next_line-1
                        execution_content=$(sed -n "${line_num},$(($next_line-1))p" "$MONITOR_OUTPUT")
                    else
                        # Extract from line_num to end
                        execution_content=$(sed -n "${line_num},\$p" "$MONITOR_OUTPUT")
                    fi

                    # Analyze this execution
                    verdict_result=$(extract_verdict_from_execution "$execution_content")
                    case "$verdict_result" in
                        *":IV")
                            printf "  %-25s %s\n" "Test Case $case_num:" "IV ($(echo $verdict_result | cut -d: -f1))" >> "$RESULTS_FILE"
                            ;;
                        *":V")
                            printf "  %-25s %s\n" "Test Case $case_num:" "V ($(echo $verdict_result | cut -d: -f1))" >> "$RESULTS_FILE"
                            ;;
                        "Completed")
                            printf "  %-25s %s\n" "Test Case $case_num:" "Completed normally" >> "$RESULTS_FILE"
                            ;;
                        "Policy-Violation")
                            printf "  %-25s %s\n" "Test Case $case_num:" "Policy Violation" >> "$RESULTS_FILE"
                            ;;
                        "Error-"*)
                            printf "  %-25s %s\n" "Test Case $case_num:" "Monitor Error" >> "$RESULTS_FILE"
                            ;;
                        "No-Terminal-Verdict")
                            printf "  %-25s %s\n" "Test Case $case_num:" "No terminal verdict found" >> "$RESULTS_FILE"
                            ;;
                        *)
                            printf "  %-25s %s\n" "Test Case $case_num:" "Unknown state ($verdict_result)" >> "$RESULTS_FILE"
                            ;;
                    esac

                done < "$temp_file.lines"
            else
                # Single execution or different format
                verdict_result=$(extract_verdict_from_execution "$(cat "$MONITOR_OUTPUT")")
                case "$verdict_result" in
                    *":IV")
                        printf "  %-25s %s\n" "Single Test Case:" "IV ($(echo $verdict_result | cut -d: -f1))" >> "$RESULTS_FILE"
                        ;;
                    *":V")
                        printf "  %-25s %s\n" "Single Test Case:" "V ($(echo $verdict_result | cut -d: -f1))" >> "$RESULTS_FILE"
                        ;;
                    "Completed")
                        printf "  %-25s %s\n" "Single Test Case:" "Completed normally" >> "$RESULTS_FILE"
                        ;;
                    "Policy-Violation")
                        printf "  %-25s %s\n" "Single Test Case:" "Policy Violation" >> "$RESULTS_FILE"
                        ;;
                    "Error-"*)
                        printf "  %-25s %s\n" "Single Test Case:" "Monitor Error" >> "$RESULTS_FILE"
                        ;;
                    "No-Terminal-Verdict")
                        printf "  %-25s %s\n" "Single Test Case:" "No terminal verdict found" >> "$RESULTS_FILE"
                        ;;
                    *)
                        printf "  %-25s %s\n" "Single Test Case:" "Unknown state ($verdict_result)" >> "$RESULTS_FILE"
                        ;;
                esac
            fi

            # Clean temporary files
            rm -f "$temp_file" "$temp_file.lines"
        else
            printf "  %-25s %s\n" "Monitor Status:" "No monitor output available" >> "$RESULTS_FILE"
        fi

        echo "" >> "$RESULTS_FILE"
    fi
done

# Return to original directory
cd "$ORIGINAL_DIR" || echo "Cannot return to original directory"

echo
echo "Results file generated: $RESULTS_FILE"