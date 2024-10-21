export BASH_SILENCE_DEPRECATION_WARNING=1
case "$OSTYPE" in
    darwin*)
        eval "$(/opt/homebrew/bin/brew shellenv)"
    ;;
esac
