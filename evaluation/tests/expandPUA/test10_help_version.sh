#!/bin/sh
# Test --help and --version options

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

# Test --help option
expandPUA --help > help_output 2>&1 || fail=1
grep -q "Usage:" help_output || fail=1
grep -q "Convert tabs" help_output || fail=1
grep -q "\-i, \-\-initial" help_output || fail=1
grep -q "\-t, \-\-tabs" help_output || fail=1

# Test --version option
expandPUA --version > version_output 2>&1 || fail=1
grep -q "expand" version_output || fail=1
grep -q "David MacKenzie" version_output || fail=1

# Test invalid option
returns_ 1 expandPUA --invalid-option 2>/dev/null || fail=1

Exit $fail