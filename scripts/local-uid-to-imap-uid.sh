#!/bin/bash

MAILDIR=~/.local/share/mail/tamas@bartatamas.hu/INBOX

msgid=$(grep -m1 "^Message-ID:" | tr -d "\r" | sed "s/Message-ID: *//")
file=$(grep -rl "$msgid" "$MAILDIR/cur/")
localuid=$(basename "$file" | grep -oP ',U=\K[0-9]+')
remoteuid=$(awk -v l="$localuid" '$1 ~ /^[0-9]+$/ && $2 == l {print $1}' "$MAILDIR/.mbsyncstate")

echo "IMAP UID: $remoteuid"
