#! /bin/sh

readlink -f "$1" > $XDG_CACHE_HOME/wallsh

multilockscreen --fx '' -u $1 ${@:2}
# multilockscreen --blur 2.0 -u $1 ${@:2}
multilockscreen -w

