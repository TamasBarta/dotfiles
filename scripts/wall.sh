#!/bin/bash

if [[ "$1" == "" ]]; then
	readlink -f ~/Pictures/Wallpaper
	exit 1
fi

swww img --transition-type center --transition-step 30 --transition-fps 100 "$1"

ln -sf "$1" ~/Pictures/Wallpaper

systemctl --user try-restart hyprpaper.service
