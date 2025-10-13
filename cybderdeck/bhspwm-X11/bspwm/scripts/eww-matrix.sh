#!/bin/bash
 
pgrep -fx "$(realpath "$0")" | grep -v "$$" >/dev/null && exit
 
chars=(ᚠᚢᚣᚥᚧᚨᚩᚬᚰᚱᚶᚸᚼᚻᛉᛇᛈᛊᛋᛎᛑᛒᛗᛖᛝᛞᛟᛠᛡᛢᛣᛤᛥᛦᛨᛪᛩᛮᛯ)
 
length=400
count=${#chars[@]}

while true; do
    text_left=""
    text_right=""
 
    for _ in $(seq 1 $length); do
        rand=$((RANDOM % count))
        text_left="${chars[$rand]}$text_left"    
        rand=$((RANDOM % count))
        text_right+="${chars[$rand]}"           
    done
 
    eww update anim_text=\"$text_left\"
    eww update anim_text_right=\"$text_right\"

    sleep 0.1
done
