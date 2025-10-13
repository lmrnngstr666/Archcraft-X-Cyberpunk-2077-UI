#!/bin/bash

state_file="/tmp/skull_anim_state"
frames=('󱏘' '󱓈' '󱓇' '󱓇' '󱓇')

[[ -f $state_file ]] || echo 0 > "$state_file"

idx=$(<"$state_file")
((idx++))
idx=$((idx % ${#frames[@]}))
echo "$idx" > "$state_file"

frame="${frames[$idx]}"

echo "$frame"
