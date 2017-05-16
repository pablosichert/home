#!/bin/bash

# hr: create a line of dashes as wide as your terminal.
# adopted from: https://github.com/LuRsT/hr/blob/master/hr
hr() {
  local LINE=''
  while (( ${#LINE} < "$(tput cols)" ))
  do
    LINE="$LINE-"
  done

  echo "${LINE}"
}

# Install Homebrew
echo "Installing: brew"
if ! type brew &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

hr

# Install Homebrew Cask
echo "Installing: brew cask"
brew cask >/dev/null

hr

# Install Atom
echo "Installing: atom"
brew cask install atom

hr

ATOM_PACKAGES="
  atom-beautify
  linter-eslint
  language-babel
  go-plus
  minimap
  minimap-git-diff
  minimap-highlight-selected
"

# Install atom plugin if not already installed
echo "Installing: atom packages"
for p in $ATOM_PACKAGES ; do
  echo "Installing: $p"
  if ! [ -d ~/.atom/packages/$p ] ; then
    apm install $p
  fi
done
