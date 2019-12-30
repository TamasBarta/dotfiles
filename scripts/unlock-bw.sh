#!/bin/sh

for ( $BW_SESSION == "" ); do
	BW_SESSION=$(rofi -dmenu -p "Unlock Bitwarden" -password -no-fixed-num-lines | bw unlock --raw)
done

echo $BW_SESSION

