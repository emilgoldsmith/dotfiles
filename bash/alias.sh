alias chrome="wait-for-internet && setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias firefox="wait-for-internet && setsid firefox && sleep 1 && exit"
alias firefox-no-verify="setsid firefox && sleep 1 && exit"
alias chrome-no-verify="setsid google-chrome --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers --enable-devtools-experiments && sleep 1 && exit"
alias spotify="setsid spotify && sleep 1 && exit"
alias reset-wifi="sudo service network-manager restart && exit"
alias signal="setsid signal-desktop && sleep 3 && exit"
alias add="git add -Ap && git status"
alias code='GTK_IM_MODULE="xim" code'
alias python='python3'
