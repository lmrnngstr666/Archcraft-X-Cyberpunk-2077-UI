#!/usr/bin/env bash

# Copyright (C) 2025 KA-AN <andryajpeni@gmail.com>

frames=(' ⠛' ' ⠋' ' ⠓' ' ⠁' ' ⠈' ' ⠂' ' ⠑' ' ⠒'  ' ⠘'  ' ⠙')
altframes=(' ⠛' ' ⠋')
colors=("#9dcc1d" "#862f2e")
# colors=("#00ffff" "#ff00ff")

while true; do
    # Check connection
    if ping -c 1 -W 1 archlinux.org &>/dev/null ||
       ping -c 1 -W 1 google.com &>/dev/null; then
        is_connected=true
    else
        is_connected=false
    fi

    # Animate
    if $is_connected; then
        for frame in "${frames[@]}"; do
            for color in "${colors[@]}"; do
                echo "%{F$color}$frame%{F-}"
                sleep 0.1
            done
        done
    else
        for alt in "${altframes[@]}"; do
            echo "$alt"
            sleep 1
        done
    fi
done
