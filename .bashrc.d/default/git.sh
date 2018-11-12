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
clean() { g clean "$@"; }
cleanup() { g cleanup "$@"; }
clone() { g clone "$@"; }
commit() { g commit "$@"; }
diff() { g diff "$@"; }
fetch() { g fetch "$@"; }
fixup() { g fixup "$@"; }
force() { g force "$@"; }
log() { g log "$@"; }
merge() { g merge "$@"; }
pick() { g pick "$@"; }
pull() { g pull "$@"; }
push() { g push "$@"; }
rebase() { g rebase "$@"; }
reflog() { g reflog "$@"; }
remote() { g remote "$@"; }
reset() { g reset "$@"; }
revert() { g revert "$@"; }
show() { g show "$@"; }
staged() { g staged "$@"; }
stash() { g stash "$@"; }
status() { g status "$@"; }
submodule() { g submodule "$@"; }
tag() { g tag "$@"; }

alias cached=staged
