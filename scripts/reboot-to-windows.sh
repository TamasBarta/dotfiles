#!/bin/sh

nextBoot=$(efibootmgr | awk -v FS='\t' '/^Boot[0-9]/ { printf("%s|%s\n", substr($1, 5, 4), substr($1, 11)); }' | $HOME/.dotfiles/scripts/rofi_with_names.sh -p "Boot Entries" -mesg "Choose a boot entry to boot into. An immediate reboot is started if any item is selected.")

notify-send $nextBoot

if [ -z "$nextBoot" ]; then
	exit 1
fi

pkexec /usr/bin/efibootmgr -n "$nextBoot"

if [ $? -eq 0 ]; then
	systemctl reboot
fi
