#!/bin/bash

todoist-cli q "$(rofi -dmenu -p "Add Todoist task" -theme-str 'listview {lines:0;}')"
