# KDE only

## Blur effect ##
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|konsole|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

