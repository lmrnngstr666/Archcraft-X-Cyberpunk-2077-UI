#!/bin/bash
 
state_file="/tmp/eww_code_bin_state" 
lines=(
    "⠀⠀0.46554⠀⠀0⠀.⠀1⠀⠀4⠀⠀5⠀⠀0⠀⠀⠀⠀⠀⠀⠀4"
    "⠀⠀0.93743⠀⠀0⠀.⠀4⠀⠀4⠀⠀5⠀⠀2⠀⠀⠀⠀⠀⠀⠀1"
    "⠀⠀⠀⠀⠀0.93743⠀0⠀.⠀4⠀⠀4⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀5"
)

[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#lines[@]}))

echo "$idx" > "$state_file"

next_idx1=$(( (idx + 1) % ${#lines[@]} ))
next_idx2=$(( (idx + 3) % ${#lines[@]} ))


echo -e "${lines[$idx]}\n${lines[$next_idx1]}\n${lines[$next_idx2]}"
