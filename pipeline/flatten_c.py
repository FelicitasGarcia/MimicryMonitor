import re
import sys

def compact_c_file(input_path, output_path):
    with open(input_path, 'r') as file:
        content = file.read()

    # Pattern to match multi-line statements (excluding comments)
    pattern = r'((?:(?:^|\n)[ \t]*(?!//|/\*).*[^;\n])+(?:\n[ \t]*(?!//|/\*).*[^;\n])+)'

    def replacer(match):
        # Replace newlines and extra whitespace with single space
        return re.sub(r'\s+', ' ', match.group(1).replace('\n', ' ')).strip()

    # Process the content
    compacted = re.sub(pattern, replacer, content, flags=re.MULTILINE)

    with open(output_path, 'w') as file:
        file.write(compacted)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python compact_c.py <input_file> <output_file>")
        print("Example: python compact_c.py input.c output_compacted.c")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    compact_c_file(input_file, output_file)
    print(f"Compacted C file saved as: {output_file}")