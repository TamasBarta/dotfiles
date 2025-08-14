#!/bin/sh

pgrep -q caffeinate
CAFFEINATE_RUNNING=$?
ICON="w"

case "$CAFFEINATE_RUNNING" in
0) # caffeinate is running
	ICON="󰛊"
	;;
*) # not running
	ICON="󰾫"
	;;
esac

sketchybar --set "$NAME" update_freq=1 icon="$ICON" click_script='pgrep -q caffeinate && pkill caffeinate || caffeinate -misu &'
