#
# ~/.bashrc
#
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export NODE_OPTIONS="--max-old-space-size=2048"

export NO_UPDATE_NOTIFIER=1
export BROWSER=brave
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias performance='sudo powertop --auto-tune ;sudo tlp start ;sudo auto-cpufreq --force reset ;exit'
alias lf='yazi'
alias powersave='sudo powertop --auto-tune ; sudo tlp bat ; sudo auto-cpufreq --force powersave ; exit'
alias update='yay -Syu --noconfirm'
alias Update='update && yay -Sc --noconfirm && exit'
alias Install="yay -S --noconfirm"
alias Delete="yay -Rns --noconfirm"
alias yt="scrapetubefzf -d"
alias vi='nvim'
PS1='[\u@\h \W]\$ '
export EZA_COLORS="di=38;2;100;180;255:ex=38;2;130;220;130;1:ln=38;2;100;220;220:im=38;2;230;120;180:vi=38;2;200;140;240:mu=38;2;240;180;100:co=38;2;240;200;90:sc=38;2;120;190;255:do=38;2;220;220;220"
alias ls='eza --icons=always --color=always --group-directories-first'
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
exit
'

export YAY_CLEAN_AFTER=1
export _JAVA_AWT_WM_NONREPARENTING=1
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd bash)"
fi

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
fi
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell bash)"
fi


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
# Emoji/Character/Math/Box/Splat/Kaomoji picker using rofimoji (Wayland)
# Files are in ~/.local/share/rofimoji/data/
emoji() {
  rofimoji --action copy --files emojis splatmoji_all custom_unicode
}

# Alias rofimoji to itself (redundant but ensures user knows they can use both)
alias rofimoji="rofimoji"
# --- FZF Integration ---
# Enable Ctrl+R (History) and Ctrl+T (Files)
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash
[ -f /usr/share/fzf/shell/completion.bash ] && source /usr/share/fzf/shell/completion.bash

export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
