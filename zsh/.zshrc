## ---- History ----
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ---- Shell behavior ----
setopt AUTO_CD
setopt CORRECT

# ---- Aliases ----
alias update='sudo dnf update && exit'
alias battery='sudo auto-cpufreq --force powersave;sudo powertop --auto-tune;sudo auto-cpufreq --turbo auto;exit'
alias performance='sudo auto-cpufreq --force performance;sudo auto-cpufreq --turbo auto;exit'
alias cleanup='sudo dnf autoremove && sudo dnf clean all && exit'
alias cleanUpdate='sudo dnf update && cleanup'
alias cd='z'
alias cdi='zi'
alias ci='nvim'
alias fzf='fzf -e'
alias lgit='lazygit'
alias cat='bat'
alias npm='pnpm'
alias vi='nvim'
alias ls='eza --icons=always --color=always --group-directories-first'

# custom Functions
install(){
  sudo dnf install "$@" && exit
}

delete(){
  sudo dnf remove "$@" && exit
}

# autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# StarShip ( terminal Style plugin )
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Cargo / Rust environment
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Environment variables
export EZA_COLORS="di=38;2;100;180;255:ex=38;2;130;220;130;1:ln=38;2;100;220;220:im=38;2;230;120;180:vi=38;2;200;140;240:mu=38;2;240;180;100:co=38;2;240;200;90:sc=38;2;120;190;255:do=38;2;220;220;220"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="zed --wait"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"   
export TERMINAL=footclient
# export __NV_PRIME_RENDER_OFFLOAD=1
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export __VK_LAYER_NV_optimus=NVIDIA_only  
export JAVA_AWT_WM_NONREPARENTING=1

# pnpm
export PNPM_HOME="/home/alterwill/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# zoxide ( better cd )
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# bun completions
[ -s "/home/alterwill/.bun/_bun" ] && source "/home/alterwill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
