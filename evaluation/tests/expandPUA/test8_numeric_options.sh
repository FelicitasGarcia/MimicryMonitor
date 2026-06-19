#!/bin/sh
# Test numeric options (-1, -2, etc.)

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

# Create test input
printf "a\tb\tc\n" > input || framework_failure_

# Test -4 option (tab width 4)
printf "a   b   c\n" > expected4 || framework_failure_
expandPUA -4 input > output4 || fail=1
compare expected4 output4 || fail=1

# Test -2 option (tab width 2)
printf "a b c\n" > expected2 || framework_failure_
expandPUA -2 input > output2 || fail=1
compare expected2 output2 || fail=1

# Test -1 option (tab width 1)
printf "abc\n" > expected1 || framework_failure_
expandPUA -1 input > output1 || fail=1
compare expected1 output1 || fail=1

Exit $fail