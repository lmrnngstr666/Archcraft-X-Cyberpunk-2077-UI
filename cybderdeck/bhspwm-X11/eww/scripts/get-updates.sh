#!/bin/bash

# Mengecek apakah checkupdates tersedia (Arch-based)
if ! command -v checkupdates &> /dev/null; then
  exit 0
fi

# Jalankan checkupdates, keluarkan nama paket + versi terbaru dengan prefix "// "
checkupdates | awk '{ print "// " $1 " " $4 }'
