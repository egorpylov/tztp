#!/bin/bash
read input
read output
find $input -type f -name "*.txt" | while read file; do
  name=$(basename "$file")
  source="$output/$name"
  if [[ -f "$source" ]]; then
    k=0
    while [[ -f "$source" ]]; do
      new_name="${name%.*}_$k.${name##*.}"
      source="$output/$new_name"
      let k+=1
    done
  fi
  cp "$file" "$source"
done
