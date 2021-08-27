#!/bin/bash

# Arbitrary but unique message id
msgId="991049"

sink=$(pactl info | grep -Po "(?<=Default Sink: ).*")

pactl set-sink-volume $sink ${1}%

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"
if [ $mute = "true" ]; then
    # Show the sound muted notification
#    dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted" 
else
    # Show the volume notification
#    dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
#    "Volume: ${volume}%" "$(getProgressString 10 "<b> </b>" " " $volume)"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume" &
