# MacOS specific stuff

# Mac only keybindings
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

if ! pgrep -f dark-mode-notify.swift &> /dev/null; then
  dark-mode-notify.swift set-kitty-dark-mode.sh & disown
fi


