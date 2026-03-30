#!/usr/bin/env bash
# /home/alterwill/auto_conserve.sh
# Toggle IdeaPad conservation_mode: enable at >=TARGET, disable below TARGET

TARGET=79
SLEEP=60
CONSERVATION_FILE="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
TEE="/usr/bin/tee" # make sure this matches `which tee`

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
  echo "$v" | sudo "$TEE" "$CONSERVATION_FILE" >/dev/null
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
