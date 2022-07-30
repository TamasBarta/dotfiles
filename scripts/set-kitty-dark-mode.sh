#!/bin/bash

if defaults read -g AppleInterfaceStyle &> /dev/null; then
  kitty +kitten themes --reload-in=all --config-file-name=$HOME/.config/kitty/config-proxy.conf nightfox
else
  kitty +kitten themes --reload-in=all --config-file-name=$HOME/.config/kitty/config-proxy.conf dayfox
fi

