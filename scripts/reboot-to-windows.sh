#!/bin/sh

windows=$(efibootmgr | awk '/ Windows / { print substr($1, 5, 4) }')

pkexec /usr/bin/efibootmgr -n "$windows"
reboot
