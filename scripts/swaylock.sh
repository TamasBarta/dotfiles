#!/bin/bash

bg=~/Pictures/Wallpapers/bg.jpg
font="SF Pro"
blur_radius=20
grace=$1

swaylock --image ~/Pictures/Wallpapers/bg.jpg \
  --clock \
  --indicator \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --effect-blur "${blur_radius}x${blur_radius}"\
  --effect-vignette 0.5:0.5 \
  --ring-color 6dc1b8 \
  --key-hl-color 880033 \
  --line-color 00000000 \
  --inside-color 00000088 \
  --separator-color 00000000 \
  --grace ${grace:0} \
  --fade-in 0.2 \
  --font "$font"

