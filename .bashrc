# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

DIM="\e[2m"
BLUE="\e[38;2;0;160;255m"
END="\e[0m"

PS1="\[$DIM\]\W\[$END\] \[$BLUE\]$\[$END\] "

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE= # The sky is the limit
HISTFILESIZE= # The sky is the limit

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Used to locally install and use "-g" npm packages
export PATH="$PATH:node_modules/.bin"

function g() {
    COMMAND="$1"
    shift

    case "$COMMAND" in
        "amend")
            git commit --amend "$@"
        ;;
        "cleanup")
            git branch --merged | grep -v "\*" | xargs git branch -d
        ;;
        "diff")
            git diff "$@"
        ;;
        "fixup")
            COMMIT="$1"
            shift
            git commit --fixup="$COMMIT" "$@"
            git rebase -i --autosquash "$COMMIT"~1 "$@"
            # unshift
            set -- "$1" "$@"
        ;;
        "force")
            git push --force-with-lease "$@"
        ;;
        "log")
            git log --graph --pretty=format':%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset' "$@"
        ;;
        "pick")
            git cherry-pick "$@"
        ;;
        "rebase")
            git rebase -i "$@"
        ;;
        "staged")
            git diff --staged "$@"
        ;;
        *)
            git $COMMAND "$@"
        ;;
    esac
}

add() { g add "$@"; }
amend() { g amend "$@"; }
bisect() { g bisect "$@"; }
blame() { g blame "$@"; }
branch() { g branch "$@"; }
checkout() { g checkout "$@"; }
cleanup() { g cleanup "$@"; }
clone() { g clone "$@"; }
commit() { g commit "$@"; }
diff() { g diff "$@"; }
fixup() { g fixup "$@"; }
fetch() { g fetch "$@"; }
force() { g force "$@"; }
log() { g log "$@"; }
pick() { g pick "$@"; }
pull() { g pull "$@"; }
push() { g push "$@"; }
rebase() { g rebase "$@"; }
reset() { g reset "$@"; }
show() { g show "$@"; }
staged() { g staged "$@"; }
stash() { g stash "$@"; }
status() { g status "$@"; }
tag() { g tag "$@"; }

alias cached=staged
