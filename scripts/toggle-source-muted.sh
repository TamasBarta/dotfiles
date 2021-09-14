#!/bin/bash

source=$(pactl info | grep -Po "(?<=Default Source: ).*")
muted=$(pamixer --source $source --get-mute)
volume=$(pamixer --source $source --get-volume)

if [ "$volume" = "0" ]; then
  pactl set-source-volume $source 0.9
else
  pactl set-source-volume $source 0
fi

# pactl set-source-mute $source toggle

