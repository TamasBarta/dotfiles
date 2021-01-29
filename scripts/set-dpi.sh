#!/bin/bash

new_dpi=$(rofi -lines 0 -dmenu -p "Enter new DPI")

sed -Ei "s/(Xft\.dpi: +)[0-9]+/\1${new_dpi:-192}/" $XDG_CONFIG_HOME/X11/Xresources

$XDG_CONFIG_HOME/bspwm/bspwmrc
