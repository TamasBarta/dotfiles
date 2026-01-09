#!/bin/bash

if [[ "$1" == "" ]]; then
	readlink -f ~/Pictures/Wallpaper
	exit 1
fi

swww img --transition-type center --transition-step 30 --transition-fps 100 "$1"

ln -sf "$1" ~/Pictures/Wallpaper

qs -c noctalia-shell ipc call wallpaper set "$1" eDP-1
qs -c noctalia-shell ipc call wallpaper set "$1" DP-1
qs -c noctalia-shell ipc call wallpaper set "$1" DP-2
qs -c noctalia-shell ipc call wallpaper set "$1" DP-3
qs -c noctalia-shell ipc call wallpaper set "$1" DP-4
qs -c noctalia-shell ipc call wallpaper set "$1" DP-5
qs -c noctalia-shell ipc call wallpaper set "$1" DP-6
qs -c noctalia-shell ipc call wallpaper set "$1" DP-7
qs -c noctalia-shell ipc call wallpaper set "$1" DP-8
qs -c noctalia-shell ipc call wallpaper set "$1" DP-9

systemctl --user try-restart hyprpaper.service
