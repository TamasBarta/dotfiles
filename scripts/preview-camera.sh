#!/bin/sh

gst-launch-1.0 pipewiresrc path="$(pw-dump | jq -r '.[] | select(.info.props."media.class" == "Video/Source") | "\(.id)|\(.info.props["api.v4l2.cap.card"])"  ' | rofi_with_names.sh -theme-str "listview {show-icons:false;}" -p " 󰵝 ")" ! videoconvert ! autovideosink
