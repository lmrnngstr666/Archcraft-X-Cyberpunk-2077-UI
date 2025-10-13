#!/bin/bash

# Menyimpan posisi frame (agar siklus animasi)
state_file="/tmp/eww_bin_line_state" 
lines=("⠀" "➖")

# Default state
[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#lines[@]}))

echo "$idx" > "$state_file"

# Output 3 baris
echo -e "${lines[$idx]}\n\n\n\n\n\n\n\n\n\n\n${lines[(idx+2)%${#lines[@]}]}\n\n\n\n\n\n\n\n\n\n${lines[(idx+2)%${#lines[@]}]}"
