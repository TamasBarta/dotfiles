#!/bin/bash

devices=$(pactl list cards short | awk 'BEGIN { err = 1 } /bluez/ {print $2; err = 0} END { exit err }')

if [ $? -ne 0 ]; then
	notify-send "No Bluetooth headsets available."
	exit
fi

if [[ "${devices[@]}" =~ " " ]]; then
	device=$(echo "$devices" | rofi -dmenu)
else
	device=$devices
fi

available_profiles=$(pactl list cards | awk "/available: yes/ { if (name == \"$device\") { print substr(\$1, 0, length(\$1)-1) } } { if (\$1 == \"Name:\") { name = \$2 } }")

selected_profile=$(echo $available_profiles | rofi -dmenu -sep ' ')

pactl set-card-profile $device $selected_profile

