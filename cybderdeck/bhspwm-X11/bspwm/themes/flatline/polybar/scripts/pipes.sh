#!/bin/bash

binary_str="0101010101110101"

frames=()
len=${#binary_str}

for ((i=1; i<=len; i++)); do
    frames+=("${binary_str:0:i}")
done

colors=(
    "#00ff00"  # bright green typical for binary style
    "#00cc00"  
    "#009900"
)

while true; do
    for frame in "${frames[@]}"; do
        for color in "${colors[@]}"; do
            echo "%{F$color}$frame%{F-}"
            sleep 0.03
        done
    done
done