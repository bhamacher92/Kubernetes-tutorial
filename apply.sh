#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage: $0 <directory> <filename>"
  echo "Error: Both directory and filename arguments are required."
  exit 1
fi


DIR="$1"
echo "Working directory: $DIR"

./run_pre_post_script.sh $DIR "pre_apply"

# Find all .yaml and .yml files recursively in the specified directory, sort them alphabetically
find "$DIR" -type f \( -iname \*.yaml -o -iname \*.yml \) | sort | while read -r file; do
  echo "Applying $file..."
  kubectl apply -f "$file"
done

./run_pre_post_script.sh $DIR "post_apply"

./info.sh
