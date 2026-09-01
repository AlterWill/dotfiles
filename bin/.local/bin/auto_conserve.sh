#!/usr/bin/env bash
# /home/alterwill/auto_conserve.sh
# Toggle IdeaPad conservation_mode: enable at >=TARGET, disable below TARGET

TARGET=79
SLEEP=60
TEE="/usr/bin/tee" # make sure this matches `which tee`

get_conservation_file() {
  local f
  for f in /sys/bus/platform/drivers/ideapad_acpi/*/conservation_mode \
           /sys/devices/platform/ideapad_acpi/*/conservation_mode \
           /sys/devices/platform/*ideapad*/conservation_mode \
           /sys/bus/platform/drivers/ideapad_acpi/conservation_mode; do
    if [[ -f "$f" ]]; then
      echo "$f"
      return
    fi
  done
  for b in /sys/class/power_supply/BAT*; do
    if [[ -f "$b/charge_control_end_threshold" ]]; then
      echo "$b/charge_control_end_threshold"
      return
    fi
  done
}

get_capacity() {
  for b in /sys/class/power_supply/BAT*; do
    [[ -f "$b/capacity" ]] && { cat "$b/capacity" 2>/dev/null && return; }
  done
  echo 0
}

ac_online() {
  for p in /sys/class/power_supply/*; do
    [[ -f "$p/type" ]] || continue
    t=$(cat "$p/type" 2>/dev/null)
    if [[ "$t" == "Mains" || "$t" == "AC" || "$t" == "ACAdapter" ]]; then
      [[ -f "$p/online" ]] && { cat "$p/online" 2>/dev/null && return; }
    fi
  done
  echo 0
}

write_conserve() {
  local v="$1"
  local target_file
  target_file=$(get_conservation_file)
  if [[ -z "$target_file" || ! -f "$target_file" ]]; then
    echo "No supported Lenovo conservation_mode or charge_control_end_threshold found" >&2
    return 1
  fi
  if [[ "$target_file" == *"charge_control_end_threshold"* ]]; then
    if [[ "$v" -eq 1 ]]; then
      echo "$TARGET" | sudo "$TEE" "$target_file" >/dev/null
    else
      echo "100" | sudo "$TEE" "$target_file" >/dev/null
    fi
  else
    echo "$v" | sudo "$TEE" "$target_file" >/dev/null
  fi
}

state="unknown"

while true; do
  cap=$(get_capacity)
  cap=${cap:-0}
  online=$(ac_online)
  online=${online:-0}

  echo "$(date '+%F %T') AC=$online CAP=${cap}% state=$state"

  if [[ "$online" -eq 1 && "$cap" -ge "$TARGET" && "$state" != "on" ]]; then
    if write_conserve 1; then
      state="on"
      echo "$(date '+%F %T') Enabled conservation_mode (cap=${cap}%)"
    fi
  elif [[ "$cap" -lt "$TARGET" && "$state" != "off" ]]; then
    if write_conserve 0; then
      state="off"
      echo "$(date '+%F %T') Disabled conservation_mode (cap=${cap}%)"
    fi
  fi

  sleep "$SLEEP"
done
