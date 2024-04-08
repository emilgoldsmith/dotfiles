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

parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

set -o emacs

autoload -U colors && colors
setopt prompt_subst
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}"'$(parse_git_branch)$ '

eval "$(direnv hook zsh)"

export DOCKER_DEFAULT_PLATFORM=linux/amd64

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# Make sure our dotfiles repo is always up to date
handle_virtual_env
handle_dot_nvm_file
commit_any_dotfile_changes
