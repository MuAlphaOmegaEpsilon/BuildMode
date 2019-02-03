#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")" # Navigate to the /tests folder

### COLORING SCHEME ###
ORANGE='\033[0;33m'
RC='\033[0m' # Remove color

### FUNCTIONS ###
function testMode
{
	mode=$1 # Get the first parameter passed to the function
	MODE="${mode^^}" # Set every character of the mode to CAPS
	if [ -d "$mode" ]; then # Remove folder from a previous run
		rm -r "$mode" 
	fi
	mkdir "$mode" # Create directory with the name of the mode
	cd "$mode" # Go inside the newly created directory
	echo -e "${ORANGE}TESTING FOR $MODE MODE$RC"
	cmake ../.. -DTEST=ON -DCMAKE_BUILD_TYPE="$mode" # Create build files
	make # Build test suite for this mode
	make test # Start testing
	result=$? # Save result of the testing
	cd .. # Go back to the parent directory
	rm -r "$mode" # Remove the created directory
	echo # Print a newline
	return "$result" # Exit with the output of the testing
}

### SCRIPT PART ###
testMode "Debug"
testMode "Release"