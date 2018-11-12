# Creates a temporary folder and calls the provided commands with the temporary
# directory path as an argument
function temp() {
    # If no arguments have been passed in
    if ! (($#)); then
        echo "Usage:

~ $ temp echo cd
/some/temp/dir
/some/temp/dir $"

        return 1
    fi

    local TEMPORARY_DIRECTORY=$(mktemp -d)

    for COMMAND in "$@"; do
        $COMMAND $TEMPORARY_DIRECTORY
    done
}
