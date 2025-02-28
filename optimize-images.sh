#!/bin/bash

for FILENAME in docs/img/*; do
    case $FILENAME in
        *.webp) continue;;
        *screenshot-*) continue;;
        *icon512_*) continue ;;
    esac
    F=$(basename -- "$FILENAME")
    magick "$FILENAME" "src/img/${F%.*}.webp"
    rm "$FILENAME"
done