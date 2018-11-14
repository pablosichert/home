DIM="\e[2m"
BLUE="\e[38;2;0;160;255m"
END="\e[0m"

if [ -n "$SSH_CONNECTION" ]; then
    PROMPT_PREFIX="\h "
fi

function prompt {
    PS1="$PROMPT_PREFIX$HOST\[$DIM\]\W\[$END\] \[$BLUE\]$\[$END\] "
}

PROMPT_COMMAND=prompt
