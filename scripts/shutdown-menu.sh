#!/bin/bash

IFS=$'\n'
options=(
    "  Lock"
    "鈴  Sleep/Suspend"
    "累  Reboot"
    "  Reboot to Windows"
    "襤  Shutdown/Power off"
    "﫼  Logout"
)
case "$(echo "${options[*]}" | rofi -i -dmenu -format 'i' -p Leave)" in
    0)
        swaylock.sh
        ;;
    1)
        systemctl suspend
        ;;
    2)
        reboot
        ;;
    3)
        reboot-to-windows.sh
        ;;
    4)
        poweroff
        ;;
    5)
        swaymsg exit
        bspc quit
        ;;
esac
