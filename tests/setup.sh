#!/bin/sh
set -euf

### NAVIGATE TO THE TESTS FOLDER ###
cd "$(dirname "$0")"

### COLORING SCHEME ###
ORANGE=$(tput setaf 3)
NOCOLOR=$(tput sgr0)

### SCRIPT CORE ###
printf "%sSETTING UP TESTS%s\\n" "${ORANGE}" "${NOCOLOR}"
if [ -d build ]; then 
	rm -rf build 
fi
mkdir build
cd build

if [ -n "${COVERAGE:-}" ]; then
	cmake ../.. -DBUILD_TESTING=ON -DCOVERAGE_FLAG=--coverage	
else
	cmake ../.. -DBUILD_TESTING=ON
fi
