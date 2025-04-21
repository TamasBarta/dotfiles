#!/bin/sh

# See if Chromium is available as chromium of chromium-browser command

options="--enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer \
	--ozone-platform=wayland"

if [ -x "$(command -v chromium)" ]; then
	browser="chromium"
elif [ -x "$(command -v chromium-browser)" ]; then
	browser="chromium-browser"
elif [ -d "/Applications/Brave Browser.app" ]; then
	browser='open -na "Brave Browser"'
	options="--args"
else
	echo "Chromium is not installed"
	exit 1
fi

sh -c "$browser $options \
	--app=\"$1\""
