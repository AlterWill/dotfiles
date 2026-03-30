#!/bin/bash

# Determine if we are in i3 or sway
if [ -n "$SWAYSOCK" ]; then
    MSG_CMD="swaymsg"
else
    MSG_CMD="i3-msg"
fi

# Get the current title to show as a placeholder (optional, rofi might not support easy placeholders)
# Prompt the user for a new name using rofi
NEW_NAME=$(rofi -dmenu -p "Rename Window" -lines 0)

# If the user entered a name
if [ -n "$NEW_NAME" ]; then
    # If the user typed "reset", restore the default dynamic title
    if [ "$NEW_NAME" == "reset" ]; then
        $MSG_CMD title_format "%title"
    else
        # Set the static title. %title includes the original title if you want to keep it part of it,
        # but usually "renaming" implies replacing it.
        # We escape potential special characters in the title
        $MSG_CMD title_format "$NEW_NAME"
    fi
fi
