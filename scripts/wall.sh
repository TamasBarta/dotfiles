#!/bin/bash

if [[ "$1" == "" ]]; then
  readlink -f ~/Pictures/Wallpaper
  exit 1
fi

new_wallpaper="$1"

if [[ "$new_wallpaper" == ~/Pictures/Wallpaper ]]; then
  new_wallpaper="$(readlink -f "$new_wallpaper")"
fi

ln -sf "$new_wallpaper" ~/Pictures/Wallpaper
noctalia msg wallpaper-set "$new_wallpaper"
matugen image -t scheme-tonal-spot -m smart "$new_wallpaper" --source-color-index 0
