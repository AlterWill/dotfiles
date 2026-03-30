#!/bin/bash

# Get battery percentage (adjust BAT0 if yours is different, check /sys/class/power_supply/)
BAT=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$BAT" -le 20 ]; then
  notify-send "⚡ Low Battery" "Battery at ${BAT}%"
fi
