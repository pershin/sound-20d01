#!/bin/sh

paths=(
  "software/sound-20d01-codec/*.c"
  "software/sound-20d01-codec/*.h"
)

tempfile="format.tmp"

for pattern in "${paths[@]}"; do
  for filename in $pattern; do
    [ -e "$filename" ] || continue

    clang-format --style=LLVM "$filename" > "$tempfile"

    if cmp -s "$filename" "$tempfile"; then
      rm "$tempfile"
    else
      printf "%s formatted\n" "$filename"
      rm "$filename"
      mv "$tempfile" "$filename"
    fi
  done
done
