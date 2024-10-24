#!/bin/bash

for FILENAME in src/img/*; do
    case $FILENAME in
        *.webp) continue;;
    esac
    F=$(basename -- "$FILENAME")
    magick convert "$FILENAME" "src/img/${F%.*}.webp"
    rm "$FILENAME"
done