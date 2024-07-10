#!/bin/bash

# Logitech MX Master 3 settings
ratbagctl "$(ratbagctl list | grep -oE '^[a-z-]+')" button 6 action set button 3
