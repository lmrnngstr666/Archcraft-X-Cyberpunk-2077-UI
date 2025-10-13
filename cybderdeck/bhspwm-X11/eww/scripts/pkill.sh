#!/bin/bash


# Matikan semua proses eww kecuali script ini sendiri
pgrep -f eww | grep -v $$ | xargs -r kill -9

# Bersihkan file state
rm -f /tmp/eww_*_state

# Jalankan daemon secara background
nohup eww daemon >/dev/null 2>&1 &
