#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <image>"
	exit 1
fi

if ! [ -f "$1" ]; then
	echo "File not found: $1"
	exit 1
fi

disks=""

if [ -x "$(command -v diskutil)" ]; then
	disks=$(diskutil list | awk '/external/ {print $1}')
elif [ -x "$(command -v lsblk)" ]; then
	disks=$(lsblk -o NAME,TRAN | awk '/usb/{print "/dev/"$1}')
else
	echo "I don't know what tool to identify your USB drives with."
	exit 1
fi

if [ -z "$disks" ]; then
	echo "No USB drives found."
	exit 1
fi

disk=$(fzf <<<"$disks")

if [ -z "$disk" ]; then
	echo "No USB drive selected."
	exit 1
fi

sudo dd if="$1" of="$disk" bs=1M status=progress
