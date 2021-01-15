#!/bin/bash

desktops=(www dev com prd off xyz)

bspc monitor -d "${desktops[@]}"

displays=($(xrandr | awk '/ connected / {print $1}'))
active_displays=($(bspc query -M --names))

current_desktop=$(bspc query --names --desktops --desktop focused)

external_monitor="DP1"

function move_desktops_to_display {
    for desktop in "${desktops[@]}"; do
	bspc desktop $desktop --to-monitor $1
    done
}

if [[ " ${displays[@]} " =~ " $external_monitor " ]]; then
    echo "External display config"
    if [[ ! " ${active_displays[@]} " =~ " eDP1 " ]]; then exit; fi
    xrandr --output DP1 --mode 3440x1440 -r 99.98 || xrandr --output $external_monitor --auto
    bspc monitor $external_monitor -a $external_monitor
    bspc monitor eDP1 -a eDP1
    move_desktops_to_display $external_monitor
    bspc desktop $current_desktop --focus
    bspc desktop $external_monitor --remove
    bspc desktop eDP1 --remove
    # bspc monitor DP1 -d "${desktops[@]}"
    bspc monitor eDP1 --remove
    xrandr --output eDP1 --off
else
    echo "Internal display config"
    xrandr --output eDP1 --primary --mode 1920x1080
    if [[ ! " ${active_displays[@]} " =~ " $external_monitor " ]]; then exit; fi
    bspc monitor $external_monitor -a $external_monitor
    bspc monitor eDP1 -a eDP1
    move_desktops_to_display eDP1
    bspc desktop $current_desktop --focus
    bspc desktop $external_monitor --remove
    bspc desktop eDP1 --remove
    # bspc monitor eDP1 -d "${desktops[@]}"
    bspc monitor $external_monitor --remove
    xrandr --output $external_monitor --off
fi
