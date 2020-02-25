#!/bin/bash

if [ "$(xrandr | grep -P "^DP-1 .*\\+")" ]; then
    xrandr --output eDP-1 --primary --mode 2560x1440 --output DP-1 --off
    bspc monitor eDP-1 -d prod browser comm prod off misc macos gaming
else
    xrandr --output eDP-1 --mode 1280x720 --output DP-1 --primary --mode 1920x1080 --left-of eDP-1
    bspc monitor eDP-1 -d spare
    bspc monitor DP-1 -d prod browser comm prod off misc macos gaming
fi
