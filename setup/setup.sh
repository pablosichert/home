function supports_associative_arrays {
    declare -A FOO
}

echo "Running setup script"

SHELL_EXECUTABLE="$(ps -p $$ -o 'comm=')"
SHELL_EXECUTABLE=${SHELL_EXECUTABLE##*-}
SHELL_VERSION="$($SHELL_EXECUTABLE --version)"

echo "Shell version: $SHELL_VERSION"

if [ "$SHELL_EXECUTABLE" != "bash" ]; then
    echo "Changing shell from $SHELL_EXECUTABLE"
    chsh -s /bin/bash
    exit 1
fi

if ! supports_associative_arrays &> /dev/null; then
    echo Your shell needs to support associative arrays to run this script
    exit 1
fi

case "$OSTYPE" in
    darwin*)
        SETUP=~/setup/setup_macOS.sh
    ;;
    linux*)
        SETUP=~/setup/setup_ubuntu.sh
    ;;
esac

if [ ! -z $SETUP ] && [ -f $SETUP ]; then
    bash $SETUP
    exit 0
fi

echo "No setup found for operating system: $OSTYPE" 1>&2
exit 1
