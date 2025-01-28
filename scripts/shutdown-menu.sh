#!/bin/bash

IFS=$'\n'
options=(
	"󰍁  Lock"
	"󰒲  Sleep/Suspend"
	"󰑐  Reboot"
	"󱊞  Reboot to USB"
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
	systemctl reboot
	;;
3)
	SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	bash -c "$SCRIPT_DIR/reboot-to-windows.sh"
	;;
4)
	systemctl poweroff
	;;
5)
	loginctl terminate-session $XDG_SESSION_ID
	;;
esac
