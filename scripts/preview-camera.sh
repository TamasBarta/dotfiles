#!/bin/sh

gst-launch-1.0 pipewiresrc path="$(
  pw-dump | jq -r '
    .[] | select(.info.props."media.class" == "Video/Source")
    | "\(.id)|\(.info.props["api.v4l2.cap.card"])|\(.info.props["api.v4l2.path"])"
  ' | if command -v v4l2-ctl >/dev/null 2>&1; then
    while IFS='|' read -r id card dev; do
      v4l2-ctl --list-formats -d "$dev" 2>/dev/null \
        | grep -Eq 'MJPG|YUYV|YU12|NV12|NV21|I420|YV12|RGB|BGR|UYVY' \
        && echo "$id|$card"
    done
  else
    while IFS='|' read -r id card dev; do
      echo "$id|$card"
    done
  fi | rofi_with_names.sh -theme-str "listview {show-icons:false;}" -p " 󰵝 "
)" ! videoscale ! video/x-raw,width=640,height=480,framerate=30/1 ! videoconvert ! autovideosink
