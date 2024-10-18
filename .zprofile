for file in $HOME/.profile.d/*.sh; do
    if [[ -f "$file" ]]; then
        source "$file"
    fi
done

export PATH=$HOME/.local/bin:$PATH
