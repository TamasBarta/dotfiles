#!/bin/bash

desktops=(www dev com prd off xyz)

bspc monitor -d "${desktops[@]}"

displays=($(xrandr | awk '/ connected / {print $1}'))
active_displays=($(bspc query -M --names))

current_desktop=$(bspc query --names --desktops --desktop focused)

external_monitor="$(xrandr | awk '/ connected / {print $1}' | grep -v eDP-1| head -1)"

function move_desktops_to_display {
    for desktop in "${desktops[@]}"; do
	bspc desktop $desktop --to-monitor $1
    done
}

if [[ " ${displays[@]} " =~ " $external_monitor " ]]; then
    echo "External display config"
    if [[ ! " ${active_displays[@]} " =~ " eDP-1 " ]]; then exit; fi
    xrandr --output DP-1 --mode 3440x1440 -r 99.98 || xrandr --output $external_monitor --auto
    bspc monitor $external_monitor -a $external_monitor
    bspc monitor eDP-1 -a eDP-1
    move_desktops_to_display $external_monitor
    bspc desktop $current_desktop --focus
    bspc desktop $external_monitor --remove
    bspc desktop eDP-1 --remove
    # bspc monitor DP-1 -d "${desktops[@]}"
    bspc monitor eDP-1 --remove
    xrandr --output eDP-1 --off
else
    echo "Internal display config"
    # xrandr --output eDP-1 --primary --mode 3840x2160
    xrandr --output eDP-1 --primary --mode 1920x1080 --panning 1920x1080
    if [[ ! " ${active_displays[@]} " =~ " $external_monitor " ]]; then exit; fi
    bspc monitor $external_monitor -a $external_monitor
    bspc monitor eDP-1 -a eDP-1
    move_desktops_to_display eDP-1
    bspc desktop $current_desktop --focus
    bspc desktop $external_monitor --remove
    bspc desktop eDP-1 --remove
    # bspc monitor eDP-1 -d "${desktops[@]}"
    bspc monitor $external_monitor --remove
    xrandr --output $external_monitor --off
fi

wall.sh $(cat $XDG_CACHE_HOME/wallsh) &
