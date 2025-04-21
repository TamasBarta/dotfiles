#!/usr/bin/zsh
# Linux specific stuff

alias open=xdg-open

if [ -z $DISPLAY ] && [[ "$(tty)" == "/dev/tty1" ]]; then
  Hyprland
  # exec sway --unsupported-gpu
fi
