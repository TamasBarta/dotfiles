#!/bin/bash

IP=$(avahi-browse -cr _adb-tls-connect._tcp | grep -oP '(?<=address = \[)[^\]]*' | head -n1)
PORT=$(avahi-browse -cr _adb-tls-connect._tcp | grep -oP '(?<=port = \[)[^\]]*' | head -n1)


adb connect "$IP:$PORT"
