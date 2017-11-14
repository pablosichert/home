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

echo "Configure dock size"
defaults write com.apple.dock tilesize -int 45 && killall Dock

hr

echo "Show hidden files in Finder"
defaults write com.apple.finder AppleShowAllFiles 1

hr

echo "Set hibernate mode when using battery"
pmset -b hibernatemode 25

hr

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

echo "Installing: brew cask fonts"
brew tap caskroom/fonts

hr

echo "Installing: Fira Code font"
brew cask install font-fira-code

hr

echo "Installing: iTerm2"
brew cask install iterm2

hr

echo "Installing: Google Chrome"
brew cask install google-chrome

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
brew install n

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

echo "Installing: MacTeX"
brew cask install mactex

hr

echo "Installing: Google Backup & Sync"
brew cask install google-backup-and-sync

hr

echo "Installing: Dropbox"
brew cask install dropbox

hr

echo "Installing: Amazon Drive"
brew cask install amazon-drive

hr

echo "Installing: WhatsApp"
brew cask install whatsapp

hr

echo "Installing: Gitter"
brew cask install gitter

hr

echo "Installing: Spotify"
brew cask install spotify

hr

echo "Installing: Qbserve"
brew cask install qbserve

hr

echo "Installing: Focus"
brew cask install focus

hr

echo "Installing: Coconut Battery"
brew cask install coconutbattery
