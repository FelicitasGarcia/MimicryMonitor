#!/bin/sh
# Test processing multiple files

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

# Create multiple test files
printf "file1\tline1\n" > file1 || framework_failure_
printf "file2\tline2\n" > file2 || framework_failure_
printf "file3\tline3\n" > file3 || framework_failure_

# Expected combined output
printf "file1   line1\nfile2   line2\nfile3   line3\n" > expected || framework_failure_

# Test processing multiple files
expandPUA file1 file2 file3 > output || fail=1
compare expected output || fail=1

Exit $fail