#!/bin/bash

frames=('󱏘' '󱓈' '󱓇' '󱓇' '󱓇')
# frames=('󰥺' '󰫊' '󰫉')
colors=("#2e2e2e" "#5c2e2e" "#742c2b" "#75201e" "#862f2e" "#75201e" "#742c2b" "#5c2e2e" "#2e2e2e")

while true; do
    for frame in "${frames[@]}"; do
        for color in "${colors[@]}"; do
            echo "%{F$color}$frame%{F-}"
            sleep 0.03
        done
    done
done
