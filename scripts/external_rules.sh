#!/bin/bash

wid=$1
class=$2
instance=$3
consequences=$4

# This is here to fix IntelliJ tooltips
if [[ "$(xtitle "$wid")" =~ ^win[0-9]+$ ]]; then
    echo "manage=off"
fi
