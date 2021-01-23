alias chrome="wait-for-internet && setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias firefox="wait-for-internet && setsid firefox && sleep 1 && exit"
alias firefox-no-verify="setsid firefox && sleep 1 && exit"
alias chrome-no-verify="setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias spotify="setsid spotify && sleep 1 && exit"
alias reset-wifi="sudo service network-manager restart && exit"
alias signal="setsid signal-desktop && sleep 3 && exit"
alias add="git add -Ap && git status"
alias code='GTK_IM_MODULE="xim" code'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
