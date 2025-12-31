#
# ~/.bashrc
#
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias performance='sudo powertop --auto-tune ;sudo tlp start ;sudo auto-cpufreq --force reset ;exit'
alias powersave='sudo powertop --auto-tune ; sudo tlp bat ; sudo auto-cpufreq --force powersave ; exit'
alias update='yay -Syu --noconfirm'
alias Update='update && yay -Sc --noconfirm && exit'
alias Install="yay -S --noconfirm"
alias Delete="yay -Rns --noconfirm"
alias vi='nvim'
PS1='[\u@\h \W]\$ '
alias eza='eza --icons=always -G'
alias yt='scrapetubefzf -d'
alias ls='eza'
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
