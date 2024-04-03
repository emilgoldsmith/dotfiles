# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

eval "$(thefuck --alias)"

source ~/dotfiles_helpers/alias.sh
source ~/dotfiles_helpers/env.sh
source ~/dotfiles_helpers/functions.sh

autoload -U colors && colors
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ "

eval "$(direnv hook zsh)"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code/picogrid
# export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=/Users/emil/.local/bin/virtualenv
source /Users/emil/.local/bin/virtualenvwrapper.sh

# Make sure our dotfiles repo is always up to date
commit_any_dotfile_changes
