#!/bin/sh
# Test reading from standard input

# Copyright (C) 2025 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
print_ver_ expandPUA

# Test reading from stdin
printf "stdin\ttest\tline\n" > input || framework_failure_
printf "stdin   test    line\n" > expected || framework_failure_

# Test with no arguments (reads from stdin)
expandPUA < input > output || fail=1
compare expected output || fail=1

# Test with explicit '-' argument
expandPUA - < input > output2 || fail=1
compare expected output2 || fail=1

Exit $fail