# User Config
export PROMPT="%F{8}%n%f:%F{2}%~%f$ "
export EDITOR=nvim
export PATH=/opt/homebrew/bin:/opt/oss-cad-suite/bin:/opt/avr/bin:/opt/ghdl/bin:$HOME/.local/bin:$PATH
export CPATH=/opt/homebrew/include:$CPATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 22)

# Aliases
alias tree="tree -a --filesfirst"
alias picocom="picocom --quiet"
alias yosys="yosys -Q -T"
alias rm="rm -r"
alias py="python3"
alias venv="source .venv/bin/activate"
alias sz="ls -lah"

bindkey -e
