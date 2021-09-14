#!/bin/bash

declare -A arr=(); while IFS='|' read -r b a; do arr["$a"]="$b"; done
val=$(IFS=$'\n'; echo "${!arr[*]}" | rofi -dmenu $@)

if [ "$val" = "" ]; then
  exit
fi

echo "${arr[$val]}"

