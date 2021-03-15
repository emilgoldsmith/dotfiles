#!/bin/bash

set -euo pipefail

sudo apt update -y
sudo apt install -y \
  git \
  vim \
  vim-gtk3 \
  screen
