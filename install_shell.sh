#!/bin/bash

set -euo pipefail

relative_dotfiles_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(realpath $relative_dotfiles_dir)

mkdir -p ~/dotfiles_helpers

# Bashrc stuff
ln -svf $dotfiles_dir/bash/alias.sh ~/dotfiles_helpers/alias.sh
ln -svf $dotfiles_dir/bash/shell_options.sh ~/dotfiles_helpers/shell_options.sh
ln -svf $dotfiles_dir/bash/env.sh ~/dotfiles_helpers/env.sh
ln -svf $dotfiles_dir/bash/prompt.sh ~/dotfiles_helpers/prompt.sh
ln -svf $dotfiles_dir/bash/functions.sh ~/dotfiles_helpers/functions.sh
ln -svf $dotfiles_dir/bash/scripts ~/dotfiles_helpers/scripts
ln -svf $dotfiles_dir/bash/bashrc.sh ~/.bashrc
ln -svf $dotfiles_dir/bash/bashrc.sh ~/.bash_profile
ln -svf $dotfiles_dir/bash/zshrc.sh ~/.zshrc
# Git
ln -svf $dotfiles_dir/git/gitconfig ~/.gitconfig
mkdir -p ~/.config/git
ln -svf $dotfiles_dir/git/global-gitignore ~/.config/git/ignore
# Vim
ln -svf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -svf $dotfiles_dir/vim/vim-packages ~/.vim
# VSCode
# VSCode not needed if we're in a VSCode remote container
set +u
if [[ -z $REMOTE_CONTAINERS ]];
then
  set -u
  mkdir -p ~/.config/Code/User
  ln -svf $dotfiles_dir/vscode/keybindings.json ~/.config/Code/User/keybindings.json
  ln -svf $dotfiles_dir/vscode/settings.json ~/.config/Code/User/settings.json
fi
set -u
