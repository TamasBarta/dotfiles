#!/usr/bin/env sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case "$INFO" in
  "WezTerm")
    ICON=
  ;;
  "Mailspring"|Mail)
    ICON=
  ;;
  "Todoist")
    ICON=󰄴
  ;;
  "Morgen"|Calendar)
    ICON=
  ;;
  "Telegram")
    ICON=
  ;;
  "SchildiChat")
    ICON=󰴻
  ;;
  "Spotify")
    ICON=
  ;;
  "Viber"|"Messenger"|Signal)
    ICON=󰇷
  ;;
  "Notion"|Obsidian)
    ICON=
  ;;
  "Finder")
    ICON=󰀶
  ;;
  "Slack")
    ICON=
  ;;
  "Firefox")
    ICON=
  ;;
  "Brave Browser")
    ICON=
  ;;
  *)
    ICON=󰘔
  ;;
esac

sketchybar --set $NAME label="$INFO" icon="$ICON"
