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

declare -A BREW_PACKAGES
BREW_PACKAGES=(
    ["tree"]="tree"
    ["htop"]="htop"
    ["httpie"]="httpie"
    ["n"]="n"
    ["yarn"]="yarn --ignore-dependencies"
    ["GraphicsMagick"]="graphicsmagick"
    ["ExifTool"]="exiftool"
)

for PACKAGE in "${!BREW_PACKAGES[@]}"; do
    echo "Installing: $PACKAGE"
    brew install ${BREW_PACKAGES[$PACKAGE]}

    hr
done

echo "Installing: brew cask fonts"
brew tap caskroom/fonts

hr

declare -A BREW_CASK_PACKAGES
BREW_CASK_PACKAGES=(
    ["Fira Code font"]="font-fira-code"
    ["iTerm2"]="iterm2"
    ["Google Chrome"]="google-chrome"
    ["Atom"]="atom"
    ["Docker"]="docker"
    ["SQLite Browser"]="sqlitebrowser"
    ["Timer"]="michaelvillar-timer"
    ["Anki"]="anki"
    ["MacTeX"]="mactex"
    ["Google Backup & Sync"]="google-backup-and-sync"
    ["Dropbox"]="dropbox"
    ["Amazon Drive"]="amazon-drive"
    ["WhatsApp"]="whatsapp"
    ["Gitter"]="gitter"
    ["Spotify"]="spotify"
    ["Qbserve"]="qbserve"
    ["Focus"]="focus"
    ["Coconut Battery"]="coconutbattery"
)

for PACKAGE in "${!BREW_CASK_PACKAGES[@]}"; do
    echo "Installing: $PACKAGE"
    brew cask install ${BREW_CASK_PACKAGES[$PACKAGE]}

    hr
done

source ~/setup/atom-packages.sh
