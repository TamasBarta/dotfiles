#!/bin/bash

adb mdns services | grep -oE '[0-9.:]{10,}' | xargs -I{} adb connect {}
