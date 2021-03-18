#!/bin/bash

new_dpi=$(rofi -lines 0 -dmenu -p "Enter new DPI")
new_cursor_size=$(($new_dpi / 96 * 24))

sed -Ei "s/(Xft\.dpi: +)[0-9]+/\1${new_dpi:-192}/" $XDG_CONFIG_HOME/X11/Xresources
sed -Ei "s/(Xcursor\.size: +)[0-9]+/\1${new_cursor_size:-64}/" $XDG_CONFIG_HOME/X11/Xresources


while pgrep -u $UID 'caprine|electron|JetBrainsSpace|spotify|slack|evolution|telegram-deskto|viber' > /dev/null; do 
    sleep 0.5
    pkill -9 'caprine|electron|JetBrainsSpace|viber'
    pkill 'spotify|slack|evolution|goa|telegram-deskto|nm-applet'
done

$XDG_CONFIG_HOME/bspwm/bspwmrc
