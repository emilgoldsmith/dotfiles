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
export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:~/.pypy/bin/
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

nvm use &> /dev/null || nvm use node &> /dev/null
