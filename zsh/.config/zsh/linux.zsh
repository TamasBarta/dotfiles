#!/usr/bin/zsh
# Linux specific stuff

alias open=xdg-open

if [ -z $DISPLAY ] && [[ "$(tty)" == "/dev/tty1" ]]; then
  # if uwsm check may-start && uwsm select; then
  #   exec uwsm start default
  # fi
  # # Hyprland
  # exit
  # # exec sway --unsupported-gpu
fi
