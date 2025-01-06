#!/bin/bash

# Check if the required arguments are provided
if [[ -z "$1" || -z "$2" ]]; then
  echo "Usage: $0 <directory> <filename>"
  echo "Error: Both directory and filename arguments are required."
  exit 1
fi

# Get the directory and filename from the arguments
DIR="$1"
FILENAME="$2"

echo "Run $FILENAME Step"

# Construct the full path to the script
SCRIPT="$DIR/$FILENAME.sh"

# Check if the script exists and is executable
if [[ -f "$SCRIPT" && -x "$SCRIPT" ]]; then
  "$SCRIPT"
else
  if [[ ! -f "$SCRIPT" ]]; then
    echo ""
  else
    echo "Error: $SCRIPT is not executable. Make it executable with: chmod +x $SCRIPT"
  fi
fi
