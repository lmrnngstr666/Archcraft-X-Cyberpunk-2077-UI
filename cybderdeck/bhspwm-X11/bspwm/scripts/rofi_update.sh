#!/usr/bin/env bash

# System Update Menu with Rofi (custom icon //, with Update All button)

# Config
DIR="$HOME/.config/bspwm"
STYLE="cyberpunk2077"
RASI="$DIR/themes/$STYLE/rofi/updates.rasi"
rofi_command="rofi -theme ${RASI} -dmenu -i -p"

update_all_option="// UPDATE ALL"

# Function to fetch updates
get_updates() {
    if ! command -v checkupdates &>/dev/null; then
        echo "checkupdates not found. Install 'pacman-contrib'."
        exit 1
    fi
    checkupdates 2>/dev/null
}

show_menu() {
    updates_list=$(get_updates)
    updates_count=$(echo "$updates_list" | grep -c '^')

    if [ "$updates_count" -eq 0 ]; then
        prompt_text="SYSTEM IS UP TO DATE"
        options="SYSTEM IS UP TO DATE"
    else
        prompt_text="$updates_count UPDATES AVAILABLE"
        options="$(echo "$updates_list" | sed 's/^/\/\/ /')"
        options="${options}\n$update_all_option"
    fi

    # Tampilkan rofi
    chosen=$(echo -e "$options" | $rofi_command "$prompt_text")

    case "$chosen" in
        "" | "SYSTEM IS UP TO DATE")
            exit 0
            ;;
        "$update_all_option")
            alacritty -e bash -c "sudo pacman -Syu; read -p 'Press enter to exit...'" &
            ;;
        *)
            package_name=$(echo "$chosen" | sed 's/^\/\/ //' | awk '{print $1}')
            pactree_output=$(pactree "$package_name" 2>/dev/null | sed 's/^/   /')
            echo -e "$package_name dependencies:\n$pactree_output" | $rofi_command "$package_name"
            show_menu
            ;;
    esac
}

show_menu
