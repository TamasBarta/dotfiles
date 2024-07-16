#!/bin/sh

chromium-browser --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer \
	--ozone-platform=wayland \
	--app="$1"
