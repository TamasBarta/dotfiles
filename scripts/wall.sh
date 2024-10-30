#!/bin/bash

if [[ "$1" == "" ]]; then
	swww query | awk '{print $NF; exit;}'
	exit 1
fi

swww img --transition-type center --transition-step 30 --transition-fps 100 "$1"
ln -sf "$1" ~/Pictures/Wallpaper
