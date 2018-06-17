alias chrome="wait-for-internet.sh && setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias chrome-no-verify="setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias spotify="setsid spotify && sleep 1 && exit"
alias reset-wifi="sudo service network-manager restart && exit"
alias skole="cd ~/Dropbox/Skole"
alias nyuad="skole && cd NYUAD"
alias semester="nyuad && cd Fall\ Junior"
alias vpn-shanghai="sudo openconnect vpn-ce.shanghai.nyu.edu"
alias gnarles-setup="~/code/gnarles/landing/myStuff/setup.sh"
alias postman="setsid ~/.Postman/Postman && sleep 1 && exit"
alias gazelle-setup="gazelle-setup.sh"
alias architect="setsid java -jar ~/.sql-architect/architect.jar && sleep 1 && exit"
alias vim="nvim"
export GRADLE_OPTS=-Dorg.gradle.daemon=true
export PATH=${PATH}:~/.pypy/bin/
export PATH=${PATH}:~/bin/
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export WORKON_HOME=$HOME/.virtualenvs
source /home/emil/.local/bin/virtualenvwrapper.sh &> /dev/null

nvm use &> /dev/null || nvm use node &> /dev/null

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'"\$(parse_git_branch)"'\$ '
