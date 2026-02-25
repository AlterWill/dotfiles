#
# ~/.bashrc
#
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export NODE_OPTIONS="--max-old-space-size=2048"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias performance='sudo powertop --auto-tune ;sudo tlp start ;sudo auto-cpufreq --force reset ;exit'
alias powersave='sudo powertop --auto-tune ; sudo tlp bat ; sudo auto-cpufreq --force powersave ; exit'
alias update='yay -Syu --noconfirm'
alias Update='update && yay -Sc --noconfirm && exit'
alias Install="yay -S --noconfirm"
alias Delete="yay -Rns --noconfirm"
alias yt="scrapetubefzf -d"
alias vi='nvim'
PS1='[\u@\h \W]\$ '
alias eza='eza --icons=always -G'
alias ls='eza'
alias cat='bat'
alias cleandisk='
 sudo paccache -rk2;
 echo "--- Pacman cache ---";

 echo "--- Yay cache ---";
 rm -rf ~/.cache/yay;

 echo "--- Orphan packages ---";
orphans=$(pacman -Qtdq);
if [ -n "$orphans" ]; then
  sudo pacman -Rns --noconfirm $orphans;
else
  echo "No orphan packages found.";
fi;

 echo "--- Journal logs (100M) ---";
sudo journalctl --vacuum-size=100M;

 echo "--- User cache ---";

 echo "--- npm cache ---";
npm cache clean --force 2>/dev/null || true;

 echo "--- Done ---";
df -h /
'

export YAY_CLEAN_AFTER=1
export _JAVA_AWT_WM_NONREPARENTING=1
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

eval "$(zoxide init --cmd cd bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  export GDK_BACKEND=x11
  export DISPLAY=:0
fi

# pnpm
export PNPM_HOME="/home/alterwill/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;; 
  *) export PATH="$PNPM_HOME:$PATH" ;; 
esac
# pnpm end

# fnm
FNM_PATH="/home/alterwill/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi


eval "$(fnm env --use-on-cd --shell bash)"


cdf() {
  local file
  # Use find to list all files/dirs including hidden ones, then pipe to fzf
  # 2>/dev/null hides permission errors
  file=$(find . -maxdepth 5 -not -path '*/.git/*' 2>/dev/null | fzf -e)

  if [[ -n "$file" ]]; then
    if [[ -f "$file" ]]; then
      cd "$(dirname "$file")"
    elif [[ -d "$file" ]]; then
      cd "$file"
    fi
  fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Clipboard function (Wayland)
# Usage:
#   wl-copy < /dev/stdin
#   wl-paste

# Emoji picker using fzf
# Downloads emoji list to ~/.cache/emojis.txt if missing.
# Usage: emoji
emoji() {
  local cache_file="$HOME/.cache/emojis.txt"
  
  if [ ! -f "$cache_file" ]; then
    echo "Downloading emoji list..."
    curl -sSL 'https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json' | \
    jq -r '.[] | .emoji + " " + .description + " (" + (.aliases | join(", ")) + ")"' > "$cache_file"
  fi

  local selected=$(cat "$cache_file" | fzf +m --prompt="Emoji> " --height=40% --layout=reverse)
  
  if [ -n "$selected" ]; then
    local icon=$(echo "$selected" | awk '{print $1}')
    echo -n "$icon" | wl-copy
    echo "Copied $icon to clipboard."
  fi
}

# --- FZF Integration ---
# Enable Ctrl+R (History) and Ctrl+T (Files)
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export NO_UPDATE_NOTIFIER=1
