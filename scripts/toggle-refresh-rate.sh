#!/bin/bash

current=$(niri msg outputs | grep -A 5 "eDP-1" | grep "Current mode")

if echo "$current" | grep -q "120"; then
  niri msg output eDP-1 mode 2880x1800@60.001
  notify-send "Refresh rate set to 60"
else
  niri msg output eDP-1 mode 2880x1800@120.000
  notify-send "Refresh rate set to 120"
fi
