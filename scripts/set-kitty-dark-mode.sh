#!/bin/bash

if defaults read -g AppleInterfaceStyle &> /dev/null; then
  kitty +kitten themes --reload-in=all --config-file-name=$HOME/.config/kitty/config-proxy.conf mocha
else
  kitty +kitten themes --reload-in=all --config-file-name=$HOME/.config/kitty/config-proxy.conf latte
fi

