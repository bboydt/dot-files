# Oh My Zsh
plugins=(git zsh-fzf-history-search)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# User Config
export PROMPT="%F{white}%n%f:%F{82}%~%f$ "
export EDITOR="nvim"
export PATH=/opt/homebrew/bin:/opt/oss-cad-suite/bin:/opt/avr/bin:/opt/ghdl/bin:$PATH
export CPATH=/opt/homebrew/include:$CPATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH

# Aliases
alias tree="tree -a --filesfirst"
alias picocom="picocom --quiet"
