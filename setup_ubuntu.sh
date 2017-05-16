#!/bin/bash

# Took heavy inspiration from https://raw.githubusercontent.com/gustavnikolaj/dotfiles/master/setup.sh

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

# shouldInstall: return boolean if a deb package is installed
shouldInstall () {
  if [ 0 == `dpkg -s $1 &> /dev/null ; echo $?` ] ; then
    echo "Skipping: $1 (already installed)"
    return 1
  else
    echo "Installing: $1"
    return 0
  fi
}

# prompt for sudo before starting
sudo echo Installing base setup.

# Installing docker for ubuntu
# Source: https://docs.docker.com/linux/step_one/
if shouldInstall docker-engine ; then
  wget -qO- https://get.docker.com/ | sh

  echo Done: docker-engine

  echo 'Adding "'`whoami`'" to the docker group.'
  sudo usermod -aG docker `whoami`

  echo "You need to log out for docker to be available without being root."
fi

hr

APT_PPAS="
  noobslab/themes
  numix/ppa
"

for p in $APT_PPAS ; do
    sudo apt-add-repository -y ppa:$p
done

sudo apt-get update

hr

APT_PACKAGES="
  git
  keepass2
  pidgin
  pidgin-otr
  vim
  curl
  unity-tweak-tool
  ultra-flat-theme
  numix-icon-theme
"

for p in $APT_PACKAGES ; do
  if shouldInstall $p ; then
    sudo apt-get install -y $p
  fi
  hr
done

if shouldInstall atom ; then
  mkdir -p ~/Sources/
  wget https://atom.io/download/deb \
    -nv \
    --show-progress \
    -O ~/Sources/atom_stable.deb
  sudo dpkg -i ~/Sources/atom_stable.deb
  echo Done: atom
fi

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

# install atom plugin if not already installed
for p in $ATOM_PACKAGES ; do
  if [ -d ~/.atom/packages/$p ] ; then
    echo "Skipping atom plugin: $p (already installed)"
  else
    apm install $p
  fi
  hr
done

hr

# Installing spotify client from testing repository instead of
# stable, because of a dependency on libgcrypt.so.11 not shipped
# with ubuntu 15.10
# source: http://ubuntuhandbook.org/index.php/2015/09/install-spotify-client-ubuntu-15-10/
if shouldInstall spotify-client ; then
  echo deb http://repository.spotify.com testing non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
  sudo apt-get update
  sudo apt-get install spotify-client
  echo Done: spotify-client
fi

hr

if shouldInstall gvm ; then
  sudo apt-get install -y curl git mercurial make binutils bison gcc build-essential
  curl -sS https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
  source ~/.gvm/scripts/gvm

  echo Done: gvm
fi

hr

if shouldInstall go ; then
  LATEST_GO_VERSION="$(gvm listall | grep -oE 'go[0-9](\.[0-9](\.[0-9])?)?$' | tail -1)"

  # Go 1.4 required to compile versions <1.4
  gvm install go1.4
  gvm use go1.4
  gvm install $LATEST_GO_VERSION
  gvm use $LATEST_GO_VERSION --default

  echo Done: go
fi
