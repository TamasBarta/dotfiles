#!/bin/bash

number_of_devices=$(adb devices -l | grep -c "device ")
device_serials=$(adb devices -l | awk '/device / { print $1; }')

if [[ "$number_of_devices" -eq 0 ]]; then
	echo "No devices connected"
	exit 1
fi

# iterate serials and compile string for the other script
choser_string=""
for serial in $device_serials; do
	choser_string+="$serial|$(adb -s "$serial" shell getprop ro.product.manufacturer) $(adb -s "$serial" shell getprop ro.product.model)"
	choser_string+=$'\n'
done

if [[ "$number_of_devices" -gt 1 ]]; then
	device=$(echo "$choser_string" | "$HOME"/.dotfiles/scripts/rofi_with_names.sh -p "Choose a device:")
else
	device=$device_serials
fi

if [ "$device" = "" ]; then
	exit
fi

scrcpy-unlocked.sh "$device" &
