#!/bin/bash

device_serials=$(adb devices -l | awk '/device / { print $1; }')

for serial in $device_serials; do
	scrcpy-unlocked.sh "$serial" &
done
