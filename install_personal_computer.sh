#!/bin/bash

### This file aspires to always be idempotent

set -euo pipefail

sudo apt update -y

# Vim and the gtk-3 which allows us to copy to clipboard in vim by installing the GUi drivers I believe
sudo apt install -y \
  vim \
  vim-gtk3 \

sudo apt install -y \
  git \
  screen \
  htop

######## Install Docker

# Docker dependencies
sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add GPG key
sudo rm /usr/share/keyrings/docker-archive-keyring.gpg && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the repository
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update for the new repository
sudo apt update -y

# Actually install
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Allow us to run without sudo
sudo groupadd --force docker
sudo usermod -aG docker $USER

########## Install VSCode

# Taken from https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-20-04/
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install -y code

# Install our VSCode extensions

code --install-extension jpotterm.simple-vim
code --install-extension ms-vscode-remote.remote-containers

########### Install Chrome

# Taken from https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-20-04/

# Only do it if not already installed though
which google-chrome || (\
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  sudo apt install -y ./google-chrome-stable_current_amd64.deb && \
  rm ./google-chrome-stable_current_amd64.deb \
)

########## Install Signal

# Taken from https://vitux.com/signal-messenger-ubuntu/

wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-xenial.list

sudo apt update -y
sudo apt install -y signal-desktop

############ Install Spotify

# Taken from https://www.spotify.com/nz/download/linux/

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update -y
sudo apt install -y spotify-client

######## Install nvm and Node

# Script is very small and doesn't install anything if already installed
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Activate nvm
. ~/.nvm/nvm.sh

# Install latest version of node
# Until the fix for this is released we have to remove unset variables here
# reference: https://github.com/nvm-sh/nvm/issues/2420
set +u
nvm install node
set -u

########### Install Yarn

# Taken from https://linuxize.com/post/how-to-install-yarn-on-ubuntu-20-04/

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update -y
# No install recommends skips the node installation, since we already have node
sudo apt install -y --no-install-recommends yarn

########### Install Dropbox

# Headless version taken from https://www.dropbox.com/install-linux

# Only do this if not already installed
test -d ~/.dropbox-dist || (\
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
  && screen -d -m ~/.dropbox-dist/dropboxd \
)

########### Install Zoom

# Taken from https://linuxize.com/post/how-to-install-zoom-on-ubuntu-20-04/

# Only do it if not already installed
which zoom || (\
  wget https://zoom.us/client/latest/zoom_amd64.deb && \
  sudo apt install ./zoom_amd64.deb && \
  rm ./zoom_amd64.deb \
)

########### Install Elm

# Taken from https://github.com/elm/compiler/blob/master/installers/linux/README.md

# Only do it if not already installed
which elm || (\
  curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz && \
  gunzip elm.gz && \
  chmod +x elm && \
  sudo mv elm /usr/local/bin/ \
)
######### Just a bit of a message

echo
echo
echo
echo "TAKE NOTICE:"
echo "In order to run docker without sudo you have to restart the computer"
echo
echo
echo

