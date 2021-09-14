#!/bin/bash

youtube-dl -o - $1 | NODE_ENV=dev DEBUG=* castnow --quiet --tomp4 --ffmpeg-f matroska --ffmpeg-vcodec h264 --ffmpeg-crf 23 --ffmpeg-preset ultrafast --ffmpeg-tune fastdecode --ffmpeg-acodec aac -
