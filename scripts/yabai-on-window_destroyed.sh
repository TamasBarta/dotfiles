#!/bin/bash

# Get the focused application
focused_app=$(yabai -m query --windows --window | jq -r '.app')

# Get the number of windows for the focused app in the current workspace
num_windows=$(yabai -m query --windows --space | jq --arg app "$focused_app" '.[] | select(.app == $app) | .id' | wc -l)

# Check if there are no windows for the focused app in the current workspace
if [ "$num_windows" -eq 0 ]; then
	# Find a window from the same app in another workspace
	target_window=$(yabai -m query --windows --space | jq -r '.[0].id')

	# Focus on the target window
	yabai -m window --focus "$target_window"
fi
