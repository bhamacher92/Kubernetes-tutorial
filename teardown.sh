#!/bin/bash

# Directory to search for YAML files (default to current directory if not provided)
DIR="${1:-.}"
echo "Workingdirectory: $DIR"

# Find all .yaml and .yml files recursively in the specified directory
find "$DIR" -type f \( -iname \*.yaml -o -iname \*.yml \) | while read -r file; do
  echo "Applying $file..."
  kubectl delete -f "$file"
done

./info.sh

