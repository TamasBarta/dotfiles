#!/bin/bash

# Arbitrary but unique message id
msgId="991048"

if [ "$1" -lt "0" ]; then
    sudo light -U ${1:1}
else
    sudo light -A $1
fi

brightness=$(light -G)
dunstify -a "changeBrightness" -u low -i brightness -r "$msgId" \
    "Brightness: ${brightness:0:-3}%" "$(getProgressString 10 "<b> </b>" " " $brightness)"