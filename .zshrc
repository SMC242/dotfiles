# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# PATH
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"

# GNUPG
# Use the current terminal session to prompt for
# the passphrase
export GPG_TTY=$(tty)

# Editors
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias cat="bat --theme=Dracula"
alias ls="eza"
alias ll="eza -la --color=always --icons=always"
alias tree="eza --tree"
alias grepc="rg --color=always"
alias find="fdfind"
alias man="batman"
alias diff="delta"
alias vim="nvim"
alias clip="xclip -sel clip"
alias fzf='fzf --preview "batcat --style=numbers --color=always {}"'
alias fvim="fzf | xargs nvim"
alias py="python3"
alias prettyprint="prettybat"

# less defaults
export LESS="--use-color -R"

# fzf defaults
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="fdfind --type f --color=always --follow --exclude .git"

# LazyGit configs
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/tokyonight_night.yml"

# pnpm
export PNPM_HOME="/home/eilidhm/.local/share/pnpm"
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
    curl -fsSL "$@" | jq "." | batcat -l json
}

export function ssh_colours() {
    ssh "$@"
    (sleep 2; setterm -default -clear rest) &
}

alias ssh=ssh_colours

alias commit-msg="curl https://whatthecommit.com/index.txt"

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

# Disable .NET telemetry
DOTNET_CLI_TELEMETRY_OPTOUT=1

# Autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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

