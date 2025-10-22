#!/bin/sh

# pgrep -q caffeinate
# CAFFEINATE_RUNNING=$?
#
# case "$CAFFEINATE_RUNNING" in
# 0) # caffeinate is running
# 	ICON="󰛊"
# 	LABEL="Caffeinated"
# 	COLOR=0xfffab387
# 	;;
# *) # not running
# 	ICON="󰾫"
# 	LABEL="Not Caffeinated"
# 	COLOR=0xffa6e3a1
# 	;;
# esac
#
# sketchybar --set "$NAME" label="$LABEL" update_freq=1 icon="$ICON" icon.color="$COLOR" click_script='pgrep -q caffeinate && pkill caffeinate || caffeinate -misu &'

MARKER="sketchybar-caffeinate:$NAME"

if pgrep -f "$MARKER" >/dev/null; then
	ICON="󰛊"
	LABEL="Caffeinated"
	COLOR=0xfffab387
else
	ICON="󰾫"
	LABEL="Not Caffeinated"
	COLOR=0xffa6e3a1
fi

sketchybar --set "$NAME" label="$LABEL" update_freq=1 icon="$ICON" icon.color="$COLOR" \
	click_script='
    if pgrep -f "'"$MARKER"'" >/dev/null; then
      pkill -f "'"$MARKER"'"
    else
      bash -c "while :; do caffeinate -dimsu -t 90; sleep 60; done" "'"$MARKER"'" &
    fi
  '
