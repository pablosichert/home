DIM="\e[2m"
BLUE="\e[38;2;0;160;255m"
END="\e[0m"

if [ -n "$SSH_CONNECTION" ]; then
    HOST="\h "
fi

PS1="$HOST\[$DIM\]\W\[$END\] \[$BLUE\]$\[$END\] "
