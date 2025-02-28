#!/bin/bash

COUNT=15
picks=()
images=(docs/img/*.webp)

for (( i=0; i<COUNT; i++ )); do
    keys=("${!images[@]}")
    rnd=$(( RANDOM % ${#keys[@]} ))
    key=${keys[$rnd]}
    picks+=("${images[$key]}")
    unset "images[$key]"
done

#echo "${picks[@]}"

montage -geometry 1000x1000+2+2 "${picks[@]}" docs/mosaic.webp
