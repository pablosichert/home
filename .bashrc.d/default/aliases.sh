# Aliases for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Aliases for copy/paste
case "$OSTYPE" in
    darwin*)
        alias copy='pbcopy'
        alias paste='pbpaste'
    ;;
    linux*)
        alias copy='xsel -i'
        alias paste='xsel -o'
    ;;
esac
