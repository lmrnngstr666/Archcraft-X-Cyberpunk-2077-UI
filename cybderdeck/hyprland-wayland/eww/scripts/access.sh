#!/usr/bin/env bash
# open_item.sh <type> <path_or_app> <root|no-root>
# Example:
#   open_item.sh folder /root root
#   open_item.sh app code no-root

TYPE="$1"       # "folder" or "app"
TARGET="$2"
ROOTFLAG="$3"   # "root" or "no-root"

# Close the eww window immediately
eww update access-manager-visible=false &>/dev/null || true

# Path to rofi askpass (user-specified)
ROFI_ASKPASS="$HOME/.config/hypr/scripts/rofi_askpass"

# helper: run with sudo using askpass (rofi)
run_with_sudo_askpass() {
  # Ensure SUDO_ASKPASS points to the rofi askpass helper
  if [ -x "$ROFI_ASKPASS" ] && command -v sudo >/dev/null 2>&1; then
    export SUDO_ASKPASS="$ROFI_ASKPASS"
    # Preserve environment variables needed for GUI display
    # -A uses askpass, -E preserves environment
    sudo -A -E "$@" &
    return 0
  fi
  return 1
}

# helper: fallback to pkexec if sudo+askpass not available
run_with_pkexec() {
  if command -v pkexec >/dev/null 2>&1; then
    # pkexec may not preserve environment; we try to pass DISPLAY/XAUTHORITY
    env DISPLAY="$DISPLAY" XAUTHORITY="$XAUTHORITY" pkexec env DISPLAY="$DISPLAY" XAUTHORITY="$XAUTHORITY" "$@" &
    return 0
  fi
  return 1
}

# helper: run without root
run_no_root() {
  "$@" &>/dev/null &
}

# Decide action
if [ "$TYPE" = "folder" ]; then
  if [ "$ROOTFLAG" = "root" ]; then
    # Prefer file manager if available
    if command -v thunar >/dev/null 2>&1; then
      # Try sudo+askpass, else pkexec, else plain xdg-open with sudo fallback
      run_with_sudo_askpass thunar "$TARGET" || run_with_pkexec thunar "$TARGET" || run_with_sudo_askpass xdg-open "$TARGET"
    else
      run_with_sudo_askpass xdg-open "$TARGET" || run_with_pkexec xdg-open "$TARGET"
    fi
  else
    xdg-open "$TARGET" &>/dev/null &
  fi

elif [ "$TYPE" = "app" ]; then
  if [ "$ROOTFLAG" = "root" ]; then
    case "$TARGET" in
      vim|ranger)
        # Terminal apps: run inside terminal emulator as root
        if command -v alacritty >/dev/null 2>&1; then
          run_with_sudo_askpass alacritty -e "$TARGET" || run_with_pkexec alacritty -e "$TARGET"
        else
          run_with_sudo_askpass xterm -e "$TARGET" || run_with_pkexec xterm -e "$TARGET"
        fi
        ;;
      *)
        # GUI apps: run as root
        run_with_sudo_askpass "$TARGET" || run_with_pkexec "$TARGET"
        ;;
    esac
  else
    # no-root apps
    case "$TARGET" in
      ranger)
        if command -v alacritty >/dev/null 2>&1; then
          alacritty -e ranger &>/dev/null &
        else
          xterm -e ranger &>/dev/null &
        fi
        ;;
      *)
        "$TARGET" &>/dev/null &
        ;;
    esac
  fi
else
  echo "Unknown type: $TYPE" >&2
  exit 2
fi
