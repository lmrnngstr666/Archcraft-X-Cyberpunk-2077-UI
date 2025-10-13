#!/bin/bash

# Copyright (C) 2025 KA-AN <andryajpeni@gmail.com>

frames=('⠐ ' '⠒ ' '⠓ ' '⠋ ' '⠉ ' '⠙ ' '⠚ ')

# Warna fade (dari gelap ke terang)
colors=("#2e2e2e" "#5c2e2e" "#862f2e" "#75201e" "#ff3333" "#75201e" "#862f2e" "#5c2e2e" "#2e2e2e")

while true; do
    for frame in "${frames[@]}"; do
        for color in "${colors[@]}"; do
            echo "%{F$color}$frame%{F-}"
            sleep 0.04
        done
    done
done
