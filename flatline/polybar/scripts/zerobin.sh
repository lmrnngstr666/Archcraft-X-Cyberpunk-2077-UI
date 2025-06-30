#!/bin/bash
# Copyright (C) 2025 KA-AN <andryajpeni@gmail.com>

 frames=(
    '␉␁␄␀ ␙␓␑'
    '␙␓␑ ␙␡␠␜' 
    '␙␓␑ ␙␓ ␙'
    '␑␑␎␆ ␡␠␜'
    '␎ ␆␂ ␂␏␐' 
    )

colors=("#2e2e2e" "#5c2e2e" "#862f2e" "#75201e" "#ff3333" "#75201e" "#862f2e" "#5c2e2e" "#2e2e2e")

while true; do
    for frame in "${frames[@]}"; do
        for color in "${colors[@]}"; do
            echo "%{F$color}$frame%{F-}"
            sleep 0.08
        done
    done
done

# #!/bin/bash

# waves=(
# "  |      "
# " | |     "
# "|   |    "
# "     |   "
# "    | |  "
# "   |   | "
# "  |     |"
# " |     | "
# "|   |   |"
# " |   |  |"
# "  | |   |"
# "   |    |"
# )

# while true; do
#     for wave in "${waves[@]}"; do
#         echo "%{F#00ffff}$wave%{F-}"
#         sleep 0.1
#     done
# done
