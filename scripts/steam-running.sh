#!/bin/zsh
set -euo pipefail

: ${HASS_SERVER:?HASS_SERVER not set}
: ${HASS_TOKEN:?HASS_TOKEN not set}

INTERVAL=${STEAM_WATCH_INTERVAL:-15}
ENTITY=${STEAM_WATCH_ENTITY:-input_boolean.steam_running}

check_running() {
	pgrep -x "steam_osx" >/dev/null || pgrep -x "steam" >/dev/null
}

send_state() {
	local s="$1"
	curl -sS -X POST \
		-H "Authorization: Bearer $HASS_TOKEN" \
		-H "Content-Type: application/json" \
		-d "{\"state\":\"$s\"}" \
		"$HASS_SERVER/api/states/$ENTITY" >/dev/null
}

trap 'exit 0' INT TERM

last="" # in-memory only (no file)
while true; do
	state="off"
	check_running && state="on"
	if [[ "$state" != "$last" ]]; then
		send_state "$state"
		last="$state"
	fi
	sleep "$INTERVAL"
done
