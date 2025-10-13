#!/bin/bash
 
state_file="/tmp/eww_code_anim_state" 
lines=(
    "Archcraft adalah distribusi"
    "Linux yang didasarkan"  
    "pada Arch Linux yang menawarkan" 
    "pengalaman desktop yang ringan," 
    "fleksibel" 
    "dan mudah dikonfigurasi oleh user" 
    )
 
[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#lines[@]}))

echo "$idx" > "$state_file"
 
echo -e "${lines[$idx]}\n${lines[(idx+1)%${#lines[@]}]}\n${lines[(idx+2)%${#lines[@]}]}\n${lines[(idx+3)%${#lines[@]}]}"
