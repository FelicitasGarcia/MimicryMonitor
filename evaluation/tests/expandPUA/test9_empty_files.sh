#!/bin/sh
# Test empty files and edge cases

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

# Test empty file
touch empty || framework_failure_
expandPUA empty > output_empty || fail=1
test ! -s output_empty || fail=1

# Test file with only newlines
printf "\n\n\n" > newlines || framework_failure_
expandPUA newlines > output_newlines || fail=1
compare newlines output_newlines || fail=1

# Test file with only tabs
printf "\t\t\t\n" > tabs_only || framework_failure_
printf "                        \n" > expected_tabs || framework_failure_
expandPUA tabs_only > output_tabs || fail=1
compare expected_tabs output_tabs || fail=1

# Test mixed whitespace
printf " \t \t \n" > mixed || framework_failure_
printf "                 \n" > expected_mixed || framework_failure_
expandPUA mixed > output_mixed || fail=1
compare expected_mixed output_mixed || fail=1

Exit $fail