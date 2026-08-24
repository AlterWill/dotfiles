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
alias cd='z'
alias cdi='zi'
alias ci='nvim'
alias fzf='fzf -e'
alias lgit='lazygit'
alias cat='bat'
alias npm='pnpm'
alias vi='nvim'

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

# StarShip ( terminal Sytle plugin )
 eval "$(starship init zsh)"

# Start or something Rust
source ~/.cargo/env

# Envirment variables
export PATH=$HOME/.local/bin:$PATH
export EDITOR="nvim"
export VISUAL="zed --wait"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"   
export TERMINAL=footclient
# export __NV_PRIME_RENDER_OFFLOAD=1
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export __VK_LAYER_NV_optimus=NVIDIA_only  
JAVA_AWT_WM_NONREPARENTING=1

# Added by Antigravity CLI installer
export PATH="/home/alterwill/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/alterwill/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# zoxide ( better cd )
eval "$(zoxide init zsh)"

# bun completions
[ -s "/home/alterwill/.bun/_bun" ] && source "/home/alterwill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
