#!/usr/bin/env bash

is_rofi_available=$(
	command -v rofi >/dev/null 2>&1
)

declare -A arr=()
while IFS='|' read -r b a; do arr["$a"]="$b"; done

if [ -z "$is_rofi_available" ]; then
	export val=$(
		IFS=$'\n'
		echo "${!arr[*]}"
	)
	# make wezterm start output whatever the stdout of it runs
	wezterm start --always-new-process -- sh -c "echo -ne \"\\033]0;floatterm\\a\";echo \"$val\" | fzf --height=100% --reverse --border --prompt='Choose an option: ' > /tmp/rofiwithnamesoutput" 2>/dev/null
	val=$(cat /tmp/rofiwithnamesoutput)
else
	val=$(
		IFS=$'\n'
		echo "${!arr[*]}" | rofi -dmenu $@
	)
fi

if [ "$val" = "" ]; then
	exit 1
fi

echo "${arr[$val]}"
