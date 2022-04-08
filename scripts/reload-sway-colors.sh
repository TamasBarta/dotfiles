#!/bin/bash

IFS=""
colors="$(sed -E 's/^set \$(.*) (.*)$/\1=\2/' ~/.config/sway/config.d/00-colors.conf)"

eval "$colors"

swaymsg client.unfocused $base00 $base00 $base05
swaymsg client.focused_inactive $base00 $base00 $base05
swaymsg client.focused $base04 $base04 $base05
swaymsg client.urgent $base08 $base08 $base05

