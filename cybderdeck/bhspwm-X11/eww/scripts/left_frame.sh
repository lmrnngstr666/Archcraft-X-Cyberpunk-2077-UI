#!/bin/bash

bar="88888888888888888888888888"
bar_width=80           # estimasi lebar bar (dalam karakter monospace)
width=270              # total panjang baris animasi
state_file="/tmp/eww_left_frame_pos"

[[ -f $state_file ]] || echo 0 > "$state_file"

pos=$(<"$state_file")
((pos++))
max_offset=$(( (width - bar_width) / 2 ))
((pos > max_offset)) && pos=0
echo "$pos" > "$state_file"

# Hitung posisi dari tengah ke kanan
center=$((width / 2))
right_pos=$((center + pos))

# Buat bar kosong
line=$(printf '%*s' "$width" "")

# Sisipkan hanya bar kanan
line=$(echo "$line" | sed "s/./$bar/$((right_pos + 1))")

echo "$line"
