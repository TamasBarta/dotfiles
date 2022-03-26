#!/bin/bash

 

echo -en "\0prompt\x1fChange prompt\n"
if [ x"$@" = x"quit" ]
then
    echo "$@"
    exit 0
fi
echo -en "reload\0icon\x1ffirefox\n"
echo "quit"
