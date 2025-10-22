#!/bin/zsh

source ~/.profile

mosquitto_sub \
	-h "$MOSQUITTO_HOST" \
	-u "$MOSQUITTO_USERNAME" \
	-P "$MOSQUITTO_PASSWORD" \
	-t "mac/steam/launch" \
	-p "${MOSQUITTO_PORT:-1883}" | xargs -I{} open steam://rungameid/{} &

wait
