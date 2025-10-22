#!/bin/sh

LABEL="$(gh api notifications -q 'length')"

if [ "$LABEL" -eq 0 ]; then
	COLOR=0xffa6e3a1
else
	COLOR=0xfff38ba8
fi

sketchybar --set "$NAME" update_freq=300 icon=󰊤 icon.color="$COLOR" label="$LABEL" click_script="open https://github.com/notifications"
