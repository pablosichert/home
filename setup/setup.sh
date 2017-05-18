#!/bin/bash
case "$OSTYPE" in
  darwin*)
    SETUP=~/setup/setup_macOS.sh
  ;;
  linux*)
    SETUP=~/setup/setup_ubuntu.sh
  ;;
esac

if [ ! -z $SETUP ] && [ -f $SETUP ]; then
  $SETUP
  exit 0
fi

echo "No setup found for operating system: $OSTYPE" 1>&2
exit 1
