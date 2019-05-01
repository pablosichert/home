DIM="\e[2m"
BLUE="\e[38;2;0;160;255m"
ORANGE="\e[38;2;255;160;0m"
RED="\e[38;2;255;0;0m"
END="\e[0m"

PROMPT_COLOR="$BLUE"

if [ -n "$SSH_CONNECTION" ]; then
    PROMPT_COLOR="$ORANGE"
    PROMPT_PREFIX="\h "
fi

# If effective user is root
if [ $(id -u) == "0" ]; then
    PROMPT_COLOR="$RED"
fi

function prompt {
    PS1="$PROMPT_PREFIX$HOST\[$DIM\]\W\[$END\] \[$PROMPT_COLOR\]$\[$END\] "
}

PROMPT_COMMAND=prompt
