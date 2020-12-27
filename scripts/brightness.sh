#!/bin/bash

# Found on Reddit posted by https://www.reddit.com/user/AndreiPavel/
# Modified by Tamás Barta

brightness=${1}

# if percentage, remove percentage sign.
percentage=false
if [[ "${brightness:${#brightness}-1}" == "%" ]]; then
  brightness=${brightness:0:-1}
  percentage=true
fi

relative=false
if [[ "${brightness:0:1}" == "+" ]] || [[ "${brightness:0:1}" == "-" ]]; then
  relative=true
fi

monitors="$(find /sys/class/backlight -maxdepth 1 -mindepth 1)"

for monitor in $(printf '%s' "${monitors}"); do
  max_brightness="$(cat "${monitor}/max_brightness")"
  current=$(cat ${monitor}/brightness)

  new_brightness=$brightness
  if ${relative}; then
    if $percentage; then
      new_brightness=$(( (current * 100 / max_brightness) + brightness))
    else
      new_brightness=$((current + brightness))
    fi
  fi

  if ${percentage}; then
    scalar_brightness="$((new_brightness * max_brightness / 100))"
  else
    scalar_brightness="${new_brightness}"
  fi

  printf '%d' "${scalar_brightness}" | tee "${monitor}/brightness"
  printf '\n'
done
