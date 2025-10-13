#!/bin/bash
 
state_file="/tmp/eww_bin_anim_state"
lines=("1001" "0011" "1101" "0101" "1110")
 
[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#lines[@]}))

echo "$idx" > "$state_file"
 
echo -e "${lines[$idx]}\n${lines[(idx+1)%${#lines[@]}]}\n${lines[(idx+2)%${#lines[@]}]}\n${lines[(idx+3)%${#lines[@]}]}\n${lines[(idx+4)%${#lines[@]}]}\n\n\n${lines[(idx+5)%${#lines[@]}]}\n${lines[(idx+1)%${#lines[@]}]}\n${lines[(idx+2)%${#lines[@]}]}\n${lines[(idx+3)%${#lines[@]}]}\n${lines[(idx+4)%${#lines[@]}]}"
