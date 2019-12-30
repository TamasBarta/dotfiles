#!/bin/sh

ids=$(xinput | awk 'tolower($0) ~ /touchpad/ {match($0, ".*id=([0-9]+).*", ids); print ids[1]}')

_set_xinput_touchpad_props() {
	xinput=$(xinput list-props $1)
	id_tapping_enabled=$(echo "$xinput" | awk '/Tapping Enabled \(/ {match($0, "\\(([0-9]+)\\)", id); print id[1]}')
	id_natural_scrolling_enabled=$(echo "$xinput" | awk '/Natural Scrolling Enabled \(/ {match($0, "\\(([0-9]+)\\)", id); print id[1]}')

	xinput set-prop $1 $id_tapping_enabled 1
	xinput set-prop $1 $id_natural_scrolling_enabled 1
}

for id in $ids; do
	_set_xinput_touchpad_props $id
done
