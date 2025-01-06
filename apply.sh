#!/bin/bash

DIR="${1:-.}"
echo "Working directory: $DIR"

# Find all .yaml and .yml files recursively in the specified directory, sort them alphabetically
find "$DIR" -type f \( -iname \*.yaml -o -iname \*.yml \) | sort | while read -r file; do
  echo "Applying $file..."
  kubectl apply -f "$file"
done

./info.sh


