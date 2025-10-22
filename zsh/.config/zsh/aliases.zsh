# Custom user defined aliases

alias wadb='adb connect $(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+"):5555'
alias wdadb='adb disconnect $(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+"):5555'
alias eadb='ssh root@$(arp -n | grep c0:ee:fb:d3:9f:66 | grep -Eo "^[0-9.]+") "setprop service.adb.tcp.port 5555
stop adbd
start adbd"'

alias restart-plasma="killall plasmashell && kstart plasmashell"
alias vim=nvim
alias lg=lazygit
alias gg=git-graph
alias which='command -v'
alias pub='dart pub'

alias cdpj="cd ~/Projects/Development/popjohn/popjohn_frontend/"

unalias ll
export EXA_ICON_SPACING=2
# export LS_COLORS="$(vivid generate catppuccin-mocha)"
alias ls="eza --group-directories-first --icons --group --classify"
alias l="ls --long"
alias la="l --all"
alias lt="l --tree"
alias lts="lt -L2"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias yt-mp3="yt-dlp --extract-audio --audio-format=mp3"

alias j=just

alias ai=opencode
