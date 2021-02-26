alias chrome="wait-for-internet && screen -d -m google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && exit"
alias firefox="wait-for-internet && screen -d -m firefox && exit"
alias firefox-no-verify="screen -d -m firefox && exit"
alias chrome-no-verify="screen -d -m google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && exit"
alias spotify="screen -d -m spotify && exit"
alias reset-wifi="sudo service network-manager restart && exit"
alias signal="screen -d -m signal-desktop && exit"
alias add="git add -Ap && git status"
alias code='GTK_IM_MODULE="xim" code'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
