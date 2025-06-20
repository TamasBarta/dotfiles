#!/bin/bash

device=$1

adb -s "$device" shell input keyevent 26 && sleep 0.5

model=$(adb -s "$device" shell getprop ro.product.device)
if [[ -f "$HOME/.dotfiles/scripts/device_passwords/$model.txt" ]]; then
	password=$(cat "$HOME/.dotfiles/scripts/device_passwords/$model.txt")
fi

if [[ -n "$password" ]]; then
	adb -s "$device" shell input keyevent 62 && sleep 0.5 && adb -s "$device" shell input text "$password" && sleep 0.5 && adb -s "$device" shell input keyevent 66 &
fi

scrcpy -s "$device" --window-title "scrcpy - $device" --stay-awake --turn-screen-off
# turn off screen

adb -s "$device" shell input keyevent 26
