#!/bin/bash

IFS=$'\n'
options=(
    "Deep Work"
    "Available Work"
    "Random"
)
case "$(echo "${options[*]}" | rofi -i -dmenu -format 'i' -p Leave)" in
    0)
        echo "Deep Work"
        pkill slack &
        pkill telegram &
        pkill kotatogram &
        dunstctl set-paused true
        ;;
    1)
        echo "Available Work"
        pgrep slack || slack &
        pgrep telegram || telegram-desktop &
        pgrep kotatogram || kotatogram-desktop &
        dunstctl set-paused false
        ;;
    2)
        echo "Random"
        pkill slack &
        pgrep telegram || telegram-desktop &
        pgrep kotatogram || kotatogram-desktop &
        dunstctl set-paused false
        ;;
esac
