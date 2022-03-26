#!/bin/sh

devices=$(brightnessctl --list | grep -o '[a-z]*\:\:kbd_backlight')

for device in $devices
do
    brightnessctl -d $device $@
done

# echo "$devices" | xargs -i -n1 brightnessctl -d {} $@
