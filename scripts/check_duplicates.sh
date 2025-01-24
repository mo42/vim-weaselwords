#!/bin/sh

for file in weaselwords_*.txt; do
  echo "Checking and removing duplicate lines in $file"
  tmp_file=$(mktemp)
  sort "$file" | uniq > "$tmp_file"
  if ! cmp -s "$file" "$tmp_file"; then
    mv "$tmp_file" "$file"
    exit 1
  else
    rm "$tmp_file"
    exit 0
  fi
done
