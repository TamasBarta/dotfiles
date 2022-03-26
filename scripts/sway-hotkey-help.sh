#!/bin/bash

cd ~/.config/sway/config.d
(grep -h ^bindsym 80-dunst.conf 80-android.conf 40-hotkeys.conf; grep -h bindsym 40-apps.conf) |sed -e 's/^[ \t]*//' | bat --language sh --file-name "Sway hotkeys"

