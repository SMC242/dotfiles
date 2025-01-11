# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

DISTRO=$(lsb_release -a | grep "Distributor ID" | cut -f2)

# Set config file home
export XDG_CONFIG_HOME="$HOME/.config"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
# Minimal config if Manjaro config isn't available
elif [[ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# PATH
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin"

# Set up GHCup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Configure git-credential-manager to use GPG
export GCM_CREDENTIAL_STORE=gpg

# GNUPG
# Use the current terminal session to prompt for
# the passphrase
export GPG_TTY=$(tty)

# Editors
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias cat="bat"
alias ls="eza"
alias ll="eza -la --color=always --icons=always"
alias tree="eza --tree"
alias grepc="rg --color=always"
alias find="fd"
alias man="batman"
# alias diff="delta"
alias vim="nvim"
alias clip="xclip -sel clip"
alias fzf='fzf --preview "bat --style=numbers --color=always {}"'
alias fvim="fzf | xargs nvim"
alias py="python3"
alias prettyprint="prettybat"
alias clip="xclip -sel clip"
alias lg="lazygit"
alias commit-msg="curl https://whatthecommit.com/index.txt"
# Bash-like time output
alias btime="TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'; time"
# Shutdown from the terminal
alias goodbye="shutdown -h; poweroff"
# Kill all Docker containers. My work computer doesn't have docker, so this is conditionally defined
command -v docker > /dev/null && alias docker-kill-all="docker kill $(docker ps -q)"
# Script for making initial commits for a newly-created Git repository
alias initial-commit="git add -A && git commit -am 'Initial commit' && git push origin"
# Convert spaces in file names to dashes
alias remove-spaces="rename -a ' ' '-' *"

# youtube-dl replaecment
BROWSER="firefox"
alias youtube-dl="yt-dlp --cookies-from-browser $BROWSER"

# less defaults
export LESS="--use-color -R"

# fzf defaults
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="fd --type f --color=always --follow --exclude .git"

# bat defaults
export BAT_THEME="Nord"

# Use the terminal's theme for FD's colours
export LS_COLORS=$(dircolors)

# LazyGit configs
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/tokyonight_night.yml"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Custom scripts
export function ezsh () {
    nvim ~/.zshrc
    [[ $? -ne 0 ]] && exit
    echo "Load changes? Y/n"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) source ~/.zshrc && echo "Loaded!"; break;;
            No ) echo "Changes not loaded"; break;;
        esac
    done
}

export function curljson() {
    curl -fsSL "$@" | jq "." | bat -l json
}


function silently(){
    local cmd="$1"
    shift  # Move the argument index past the command name
    "$cmd" "$@" > /dev/null 2>&1 &
}

# Keybinds
bindkey "^[[1;5C" forward-word  # CTRL + Left
bindkey "^[[1;5D" backward-word  # CTRL + Right
bindkey "^H" backward-kill-word  # CTRL + Backspace
bindkey "5~" kill-word  # CTRL + DEL

# History
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=10000
export HISTSIZE=10000
setopt SHARE_HISTORY

# Python easy venv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

case "$DISTRO" in
  ManjaroLinux)
    source $HOME/.local/bin/virtualenvwrapper.sh
    ;;
  Ubuntu)
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh /dev/null 2>&1
    ;;
  *)
    "Failed to load virtualenvwrapper: unknown distribution --> don't know the path to virtualenvwrapper.sh"
esac

# Initialisers
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

# Docker initialisation
fpath=(~/.docker/completions $fpath)
autoload -Uz compinit && compinit
# Make autocomplete case-insensitive
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Start TMux if in an interactive session and not already in TMux or GNU Screen
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux attach 2> /dev/null || exec tmux new-session
fi

# source "$HOME/startup-script.zsh"
