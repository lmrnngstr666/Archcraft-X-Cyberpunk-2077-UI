#!/usr/bin/env bash



# Jalankan daemon eww
eww daemon &
sleep 1


# Fungsi: Matikan jika ada lebih dari satu proses dengan nama tertentu
kill_if_multiple() {
    local pname=$1
    local pids
    pids=($(pgrep -x "$pname"))

    if [ "${#pids[@]}" -gt 1 ]; then
        echo "[-] Multiple '$pname' found (${#pids[@]}). Killing all..."
        pkill -x "$pname"
    fi
}

# Fungsi: Matikan jika ada proses berdasarkan command lengkap
kill_by_command() {
    local cmd=$1
    local pids
    pids=($(pgrep -f "$cmd"))

    if [ "${#pids[@]}" -gt 1 ]; then
        echo "[-] Duplicate command '$cmd' found. Killing all..."
        pkill -f "$cmd"
    fi
}

# Matikan jika ada duplikasi eww daemon
kill_if_multiple "eww"

# Daftar jendela eww yang ingin dibuka
eww_windows=(
    "out_left-frame"
    "dot-frame-right"
    "bindot-frame-right"
    "binline-frame-right"
    "code-anim-bottom"
    "code-bin-bottom"
)

# Buka jendela jika belum terbuka
for win in "${eww_windows[@]}"; do
    if ! pgrep -f "eww open $win" > /dev/null; then
        eww open "$win" &
    fi
done

# Pastikan tidak ada duplikasi window
for win in "${eww_windows[@]}"; do
    kill_by_command "eww open $win"
done

# Daftar script animasi yang ingin dipantau
animation_scripts=(
    "$HOME/.config/eww/scripts/matrixleft.sh"
    "$HOME/.config/eww/scripts/matrixright.sh"
    "$HOME/.config/eww/scripts/bin_anim.sh"
    "$HOME/.config/eww/scripts/bin_line.sh"
    "$HOME/.config/eww/scripts/code_anim.sh"
    "$HOME/.config/eww/scripts/code_bin.sh"
    "$HOME/.config/eww/scripts/dot_anim.sh"
    "$HOME/.config/eww/scripts/out_left_top.sh"
)

# Matikan duplikasi script animasi
for script in "${animation_scripts[@]}"; do
    kill_by_command "bash $script"
done
