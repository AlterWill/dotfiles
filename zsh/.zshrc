# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## ---- History ----
HISTSIZE=40000
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups

# ---- Shell behavior ----
setopt AUTO_CD
setopt CORRECT

# ---- Aliases ----
alias dFirefox='sudo dnf remove firefox'
alias update='sudo dnf update && dFirefox'
alias Update='update && exit'
alias battery='sudo auto-cpufreq --force powersave;sudo powertop --auto-tune;sudo auto-cpufreq --turbo auto;dFirefox;exit'
alias performance='sudo auto-cpufreq --force performance;sudo auto-cpufreq --turbo auto;dFirefox'
alias Performance='performance && exit'
alias pcu='performance ; dms system update --noconfirm  ; cleanup'
alias Pcu='pcu && exit'
alias cleanup='sudo dnf autoremove && sudo dnf clean all'
alias CleanUpdate='update && cleanup && exit'
alias cd='z'
alias cdi='z -i'
alias fzf='fzf -e'
alias fcd='cd $(pwd) && cd $(fd --type directory | fzf)'
alias ncd='pos=$(pwd) && nvim $(fd --type file | fzf) && cd $pos'
alias lgit='lazygit'
alias cat='bat'
alias vi='nvim'
alias ls='eza --icons=always --color=always --group-directories-first'

# custom Functions
install(){
  sudo dnf install "$@" && dFirefox && exit
}

delete(){
  sudo dnf remove "$@" && dFirefox && exit
}

# enable OSC 7 for opening the terminal in same directory
chpwd() {
  print -Pn "\e]7;file://%m$PWD\e\\"
}

# Cargo / Rust environment
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Environment variables
export EZA_COLORS="di=38;2;100;180;255:ex=38;2;130;220;130;1:ln=38;2;100;220;220:im=38;2;230;120;180:vi=38;2;200;140;240:mu=38;2;240;180;100:co=38;2;240;200;90:sc=38;2;120;190;255:do=38;2;220;220;220"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL=foot
export JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt6ct

# bun completions
[ -s "/home/alterwill/.bun/_bun" ] && source "/home/alterwill/.bun/_bun"

# opencode
export PATH=/home/alterwill/.opencode/bin:$PATH

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Add in powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
