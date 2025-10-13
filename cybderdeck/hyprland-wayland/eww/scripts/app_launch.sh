#!/bin/bash

case "$1" in
  code)
    env ELECTRON_ENABLE_WAYLAND=1 code .
    ;;
  geany)
    geany &
    ;;
  firefox)
    firefox &
    ;;
  obs)
    obs &
    ;;
  kitty)
    kitty &
    ;;
  ranger)
    kitty -e ranger &
    ;;
  vim)
    kitty -e vim &
    ;;
  nvim)
    kitty -e nvim &
    ;;
  *)
    echo "Unknown app id: $1"
    ;;
esac
