#!/bin/bash

# Spinner dots
dots=("⬢⬡   ⬡⬡ ⬡⬡" "⬡⬢   ⬡⬡ ⬡⬡" "⬡⬡   ⬡⬡ ⬡⬢" "⬢⬡   ⬢⬡ ⬡⬡" "⬢⬡   ⬢⬡ ⬡⬢" "⬢⬡   ⬢⬡ ⬡⬡" "⬡⬡   ⬢⬢ ⬡⬡" "⬢⬡   ⬡⬡ ⬡⬢"  "⬡⬢   ⬡⬡ ⬢⬡")
state_file="/tmp/eww_dot_anim_state" 
[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#dots[@]}))

echo "$idx" > "$state_file"
echo "${dots[$idx]}"
