#!/bin/bash

IFS=$'\n'
options=(
	"󰍁  Lock"
	"󰒲  Sleep/Suspend"
	"󰑐  Reboot"
	"  Reboot to Windows"
	"󰐥  Shutdown/Power off"
	"󰗽  Logout"
)
case "$(echo "${options[*]}" | rofi -i -dmenu -format 'i' -p Leave)" in
0)
	loginctl lock-session
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
	hyprctl dispatch exit
	swaymsg exit
	bspc quit
	;;
esac
