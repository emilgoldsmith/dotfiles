#!/bin/bash

set -euo pipefail

if [[ $SHELL = '/bin/zsh' ]]; then 
    this_file=$(realpath "${(%):-%N}")
else 
    this_file=$(realpath "${BASH_SOURCE[0]}")
fi
dotfiles_dir=$(dirname $this_file)

cd "$dotfiles_dir"

git clone git@github.com:emilgoldsmith/dotfiles.git temp

mv temp/.git .

rm -rf temp
