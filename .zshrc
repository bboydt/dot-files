# Zinit

ZINIT_HOME="$HOME/.local/share/zinit"

if [ ! -d "$ZINIT_HOME" ]; then
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

# Configuration

bindkey -e

HISTFILE=$HOME/.zsh_history
HISTSIZE=16384
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"

export PROMPT="%B%F{black}%n@%m%f%b %F{blue}%~%f %B%F{black}$%f%b "

# Aliases

alias ls="ls --color"
alias rm="rm -r"
alias cp="cp -r"
alias py="python3"
alias venv="source .venv/bin/activate"

# Path

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

