#!/bin/bash

adb mdns services | grep -v 5555 | grep -oE '[0-9.:]{10,}' | xargs -I{} adb connect {}
