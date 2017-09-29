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

echo "Installing: iTerm2"
brew cask install iterm2

hr

# Install Atom
echo "Installing: atom"
brew cask install atom

hr

source ~/setup/atom-packages.sh

hr

echo "Installing: docker"
brew cask install docker

# Install httpie
echo "Installing: httpie"
brew install httpie

hr

# Install n
echo "Installing: n"
if ! type n &>/dev/null; then
  DIR=~/Github/tj
  mkdir -p $DIR
  cd $DIR
  git clone https://github.com/tj/n
  cd n
  make install
fi

hr

# Install yarn
echo "Installing: yarn"
brew install yarn --ignore-dependencies

hr

echo "Installing: GraphicsMagick"
brew install graphicsmagick

hr

echo "Installing: SQLite Browser"
brew cask install sqlitebrowser

hr

echo "Installing: ExifTool"
brew install exiftool

hr

echo "Installing: Timer"
brew cask install michaelvillar-timer

hr

echo "Installing: Anki"
brew cask install anki

hr

echo "Installing: Spotify"
brew cask install spotify
