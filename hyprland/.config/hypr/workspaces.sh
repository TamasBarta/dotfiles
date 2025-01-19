#!/bin/sh

handle() {
	case $1 in
	monitoradded*)
		"$XDG_CONFIG_HOME/hypr/apply-layout.sh"
		;;
	monitorremoved*)
		"$XDG_CONFIG_HOME/hypr/apply-layout.sh"
		;;
	esac
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
