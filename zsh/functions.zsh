function akill() {
    adb shell ps | grep $1 | grep -Eo " [0-9]+ " | head -1 | xargs adb shell kill
}

