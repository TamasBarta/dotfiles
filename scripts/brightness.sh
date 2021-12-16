#!/bin/sh

devices=$(brightnessctl --list | awk "\$1 == \"Device\" && \$5 == \"'backlight':\" { print substr(\$2, 2, length(\$2) -2); }")

for device in $devices
do
  current=$((100 * $(brightnessctl -d $device g) / $(brightnessctl -d $device m)))
  currentRaw=$(brightnessctl -d $device g)
  
  if [[ "${@: -1}" =~ ^\+.* && "$currentRaw" -eq 0  ]]; then
    brightnessctl -d $device s 1
  elif [[ "${@: -1}" =~ .*-$ && "$current" -eq 1 ]]; then
    brightnessctl -d $device s 1
  elif [[ "${@: -1}" =~ ^\+.* && "$current" -lt 11  ]]; then
    brightnessctl -d $device s +1%
  elif [[ "${@: -1}" =~ .*-$ && "$current" -lt 11 ]]; then
    brightnessctl -d $device s 1%-
  else
    brightnessctl -d $device $@
  fi
done

# echo "$devices" | xargs -i -n1 brightnessctl -d {} $@
