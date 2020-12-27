#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
pkill -f playerctl\ --player=spotify\ metadata\ --format\ 

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar main -c ~/.config/polybar/config.ini &
# polybar mainleft -c ~/.config/polybar/config.ini &
