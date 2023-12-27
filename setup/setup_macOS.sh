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

echo "Don't create .DS_Store files"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

hr

echo "Show hidden files in Finder"
defaults write com.apple.Finder AppleShowAllFiles 1 && killall Finder

hr

echo "Set hibernate mode when using battery"
sudo pmset -b hibernatemode 3

echo "Disable swap, compress memory only"
sudo nvram boot-args="vm_compressor=2"

hr

# Install Homebrew
echo "Installing: brew"
if ! type brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

hr

declare -A BREW_PACKAGES
BREW_PACKAGES=(
    ["CMake"]="cmake"
    ["ExifTool"]="exiftool"
    ["GNU File, Shell, and Text utilities"]="coreutils"
    ["GnuPG"]="gnupg"
    ["GraphicsMagick"]="graphicsmagick"
    ["htop"]="htop"
    ["jq"]="jq"
    ["n"]="n"
    ["tig"]="tig"
    ["tree"]="tree"
    ["wget"]="wget"
)

for PACKAGE in "${!BREW_PACKAGES[@]}"; do
    echo "Installing: $PACKAGE"
    brew install ${BREW_PACKAGES[$PACKAGE]}

    hr
done

echo "Installing: brew cask fonts"
brew tap homebrew/cask-fonts

hr

declare -A BREW_CASK_PACKAGES
BREW_CASK_PACKAGES=(
    ["Autumn"]="autumn"
    ["Chromium"]="chromium"
    ["Discord"]="discord"
    ["Element"]="element"
    ["Firefox"]="firefox"
    ["Focus"]="focus"
    ["Google Chrome"]="google-chrome"
    ["iTerm2"]="iterm2"
    ["MacTeX"]="mactex"
    ["Nextcloud"]="nextcloud"
    ["Qbserve"]="qbserve"
    ["Signal"]="signal"
    ["Spotify"]="spotify"
    ["SQLite Browser"]="db-browser-for-sqlite"
    ["Telegram"]="telegram"
    ["Toggl Track"]="toggl-track"
    ["VLC media player"]="vlc"
    ["VS Code"]="visual-studio-code"
    ["WhatsApp"]="whatsapp"
)

for PACKAGE in "${!BREW_CASK_PACKAGES[@]}"; do
    echo "Installing: $PACKAGE"
    brew install --cask ${BREW_CASK_PACKAGES[$PACKAGE]}

    hr
done

echo "Disable swipe navigation gestures in Chrome"
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

hr

source ~/setup/vscode-packages.sh
