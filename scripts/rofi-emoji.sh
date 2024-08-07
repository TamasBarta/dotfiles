#!/usr/bin/env bash
#
# Gist https://gist.github.com/mmirus/840c907f02dfb491a150be4e459893d1
#
# Forked from https://gist.github.com/omc8db/d95462784bc1c5c41f7f489df5dbc377
#
#   Use rofi to pick emoji because that's what this
#   century is about apparently...
#
#   Requirements:
#     rofi, wtype, wl-copy, curl
#
#   Usage:
#     1. Download all emoji
#        $ rofi-emoji --download
#
#     2. Run it!
#        $ rofi-emoji
#
#   Notes:
#     * You'll need a emoji font like "Noto Emoji" or "EmojiOne".
#     * Confirming an item will automatically paste it WITHOUT
#       writing it to your clipboard.
#     * Ctrl+C will copy it to your clipboard WITHOUT pasting it.
#

# Where to save the emojis file.
EMOJI_FILE="$HOME/.cache/emojis.txt"

function notify() {
	if [ "$(command -v notify-send)" ]; then
		notify-send "$1" "$2"
	fi
}

function download() {
	notify "$(basename "$0")" 'Downloading all emoji for your pleasure'

	curl https://unicode.org/emoji/charts/full-emoji-list.html |
		grep -Po "class='(chars|name)'>\K[^<]+" |
		paste - - >"$EMOJI_FILE"

	notify "$(basename "$0")" "We're all set!"
}

function display() {
	emoji=$(grep -v '#' "$EMOJI_FILE" | grep -v '^[[:space:]]*$')
	line=$(echo "$emoji" | rofi -dmenu -i -p emoji -kb-secondary-copy "" -kb-custom-1 Ctrl+c -theme-str 'configuration {show-icons:false;} element {padding: 20px;} listview{columns:8;}' "$@")
	exit_code=$?

	IFS=$'\t' read -r -a line <<<"$line"

	if [ $exit_code == 0 ]; then
		sleep 0.1 # Delay pasting so the text-entry can come active
		wtype "${line[0]}"
	elif [ $exit_code == 10 ]; then
		echo -n "${line[0]}" | wl-copy
	fi
}

# Some simple argparsing
if [[ "$1" =~ -D|--download ]]; then
	download
	exit 0
elif [[ "$1" =~ -h|--help ]]; then
	echo "usage: $0 [-D|--download]"
	exit 0
fi

# Download all emoji if they don't exist yet
if [ ! -f "$EMOJI_FILE" ]; then
	download
fi

# display displays :)
display "$@"
