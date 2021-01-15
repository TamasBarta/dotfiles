#!/bin/bash

IFS=$'\n'

devices=($(pactl list cards | awk '/Name: / { print $2 } /device\.description/ { $1=$2=""; gsub(/(^(\s|")+|(\s|")+$)/, "", $0); print $0 }'))

device_names=($(IFS=$'\n'; for ((i=0; $i<${#devices[@]}; i=$i+2)); do echo "${devices[$i]}"; done))
device_descriptions=($(IFS=$'\n'; for ((i=1; $i<${#devices[@]}; i=$i+2)); do echo "${devices[$i]}"; done))

if [ "${#device_names[@]}" -eq 0 ]; then
    notify-send "No Bluetooth headsets available."
    exit
elif [ "${#device_names[@]}" -gt 1 ]; then
    device_index=$(echo "${device_descriptions[*]}" | rofi -i -dmenu -format 'i')
    device="${device_names[$device_index]}"
else
    device=$devices
fi

available_profiles=($(pactl list cards | awk "/available: yes/ { if (name == \"$device\") { line = \$0; gsub(/(^[^ ]* |\\([^()]*\\)$)/, \"\", line); print substr(\$1, 0, length(\$1)-1); print line;} } { if (\$1 == \"Name:\") { name = \$2 } }"))

available_profile_names=($(IFS=$'\n'; for ((i=0; $i<${#available_profiles[@]}; i=$i+2)); do echo "${available_profiles[$i]}"; done))
available_profile_descriptions=($(IFS=$'\n'; for ((i=1; $i<${#available_profiles[@]}; i=$i+2)); do echo "${available_profiles[$i]}"; done))

selected_profile_index=$(echo "${available_profile_descriptions[*]}" | rofi -i -dmenu -format 'i')
selected_profile="${available_profile_names[$selected_profile_index]}"

pactl set-card-profile $device $selected_profile

