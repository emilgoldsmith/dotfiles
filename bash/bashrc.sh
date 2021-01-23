# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source ~/dotilfes_helpers/shell_options.sh
source ~/dotfiles_helpers/alias.sh
source ~/dotfiles_helpers/env.sh
source ~/dotfiles_helpers/prompt.sh
source ~/dotfiles_helpers/functions.sh

# Make sure our dotfiles repo is always up to date
commit_any_dotfile_changes
