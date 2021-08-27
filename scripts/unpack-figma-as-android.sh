#!/bin/bash

targetdir=${2:-~/Development/Tier/consumer-app-android/app/src/main/res}
name=$1

for filename in ./*-*dpi.png; do
 dpilevel=$(echo "$filename" | grep -Po '(?<=\-)\w+dpi(?=\.png)')
 target="${targetdir}/drawable-${dpilevel}/${name}.png"
 echo "$filename => $target"
 cp "$filename" "$target"
done
