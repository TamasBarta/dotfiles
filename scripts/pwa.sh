#!/bin/sh

# See if Chromium is available as chromium of chromium-browser command

if [ -x "$(command -v chromium)" ]; then
	browser="chromium"
elif [ -x "$(command -v chromium-browser)" ]; then
	browser="chromium-browser"
else
	echo "Chromium is not installed"
	exit 1
fi

$browser --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer \
	--ozone-platform=wayland \
	--app="$1"
