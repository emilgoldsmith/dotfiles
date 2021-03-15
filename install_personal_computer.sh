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
  screen

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
