case "$OSTYPE" in
    darwin*)
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    ;;
esac
