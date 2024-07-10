#!/bin/sh

flatpak run com.brave.Browser --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland --app=$1
