#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

sketchybar --set "$NAME" update_freq=300 icon=󰊤 label="$(gh api notifications -q 'length')" click_script="open https://github.com/notifications"
