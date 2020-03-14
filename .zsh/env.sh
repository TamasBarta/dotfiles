#!/bin/sh

eval $(awk '$0="export "$0' /home/tamas/.config/environment.d/*.conf)

