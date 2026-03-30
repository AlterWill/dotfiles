#!/bin/bash
mkdir -p ~/Pictures/screenshots
FILE=~/Pictures/screenshots/grim_window_$(date +%Y%m%d%H%M%S).png
grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$FILE" && wl-copy < "$FILE" && notify-send "Screenshot Taken" "Window saved to $FILE and copied to clipboard" -i "$FILE"