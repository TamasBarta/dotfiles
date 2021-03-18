#!/bin/bash

IFS=$'\n'
options=(
    " Lock"
    "鈴 Sleep/Suspend"
    "累 Reboot"
    "襤 Shutdown/Power off"
)
case "$(echo "${options[*]}" | rofi -i -dmenu -format 'i' -p Leave)" in
    0)
        multilockscreen -l
        ;;
    1)
        systemctl suspend
        ;;
    2)
        reboot
        ;;
    3)
        poweroff
        ;;
esac
