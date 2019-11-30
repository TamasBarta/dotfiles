#!/bin/bash

current_gap=$(bspc config window_gap)

if [[ "$current_gap" -eq 90 ]]; then 
    new_gap=0
else
    new_gap=$(("$current_gap" + 15))
fi

bspc config window_gap $new_gap
