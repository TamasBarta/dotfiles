#!/bin/sh

handle() {
	case $1 in
	monitoradded*)
		handleMonitorAdded
		;;
	monitorremoved*)
		handleMonitorRemoved
		;;
	esac
}

handleMonitorRemoved() {
	hyprctl keyword monitor eDP-1,preferres,auto,auto
}

handleMonitorAdded() {
	hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 3 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 5 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 7 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 8 HDMI-A-1
	hyprctl dispatch moveworkspacetomonitor 9 eDP-1
}

sleep 1
handleMonitorAdded

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
