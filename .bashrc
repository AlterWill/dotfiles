#
# ~/.bashrc
#
export PATH="$HOME/.local/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias performance='sudo powertop --auto-tune ;sudo tlp start ;sudo auto-cpufreq --force reset ;exit'
alias powersave='sudo powertop --auto-tune ; sudo tlp bat ; sudo auto-cpufreq --force powersave ; exit'
alias update='sudo timeshift --create && yay -Syu --noconfirm'
alias Update='update && yay -Sc --noconfirm && exit'
alias Install="yay -S --noconfirm"
alias Delete="yay -Rns --noconfirm"
alias vi='nvim'
alias nvim='NVIM_APPNAME=nvim nvim'
PS1='[\u@\h \W]\$ '

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

