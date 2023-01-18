# Custom user defined aliases

alias wadb='adb connect $(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+"):5555'
alias wdadb='adb disconnect $(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+"):5555'
alias eadb='ssh root@$(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+") "setprop service.adb.tcp.port 5555
stop adbd
start adbd"'

alias restart-plasma="killall plasmashell && kstart plasmashell"
alias vim=nvim
alias lg=lazygit
alias which='command -v'

alias cdpj="cd ~/Projects/Development/popjohn/popjohn_frontend/"

alias l="lsd --long"
alias ls="lsd"
