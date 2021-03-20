#!/bin/bash

set -euo pipefail

this_file=$(realpath "${BASH_SOURCE[0]}")
dotfiles_dir=$(dirname $this_file)

cd "$dotfiles_dir"

git clone git@github.com:emilgoldsmith/dotfiles.git temp

mv temp/.git .

rm -rf temp
