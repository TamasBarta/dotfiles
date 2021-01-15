#!/bin/bash

device=$(adb devices -l | awk '/device / { name = $1; gsub(/(^.*device:|\s.*$)/, "", $0); print name "|" $0 }' | $HOME/.dotfiles/scripts/rofi_with_names.sh -p "Choose a device:")

scrcpy -s "$device"
