#!/bin/sh

windows=0004

pkexec /usr/bin/efibootmgr -n $windows
reboot

