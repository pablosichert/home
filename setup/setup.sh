#!/bin/bash
if [[ "${BASH_VERSION%%[^0-9]*}" < "4" ]]; then
    echo Please run this script using bash 4 or newer
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
