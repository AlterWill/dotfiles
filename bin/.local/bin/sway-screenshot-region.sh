#!/bin/bash
mkdir -p ~/Pictures/screenshots
FILE=~/Pictures/screenshots/grim_region_$(date +%Y%m%d%H%M%S).png
grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify-send "Screenshot Taken" "Region saved to $FILE and copied to clipboard" -i "$FILE"
