#!/usr/bin/env zsh

is_closed=$(grep -c closed /proc/acpi/button/lid/*/state)

if [[ $is_closed -eq 1 ]]; then
  hyprctl keyword monitor "eDP-1,disable"
else
  hyprctl keyword monitor "eDP-1,preferred,auto,auto"
fi
