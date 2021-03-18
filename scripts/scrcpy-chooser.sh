#!/bin/bash

devices=($(adb devices -l | awk '/device / { name = $1; gsub(/(^.*device:|\s.*$)/, "", $0); print name "|" $0 }'))

echo "${#devices[@]}" 

if [[ "${#devices[@]}" -gt 1 ]]; then
    device=$(echo "$devices" | $HOME/.dotfiles/scripts/rofi_with_names.sh -p "Choose a device:")
else
    device=$(echo "${devices[@]}" | cut -d '|' -f 1)
fi

scrcpy -s "$device"
