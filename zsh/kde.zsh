# KDE only

## Blur effect ##
if [ `echo $DISPLAY` ]; then
    konsolex=$(qdbus | grep konsole | cut -f 2 -d\ )
    if [ -n konsolex ]; then
        for konsole in $konsolex; do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id `qdbus $konsole /konsole/MainWindow_1 winId`;
        done
    fi
    if [ `qdbus | grep org.kde.yakuake` ]; then
#	    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id `xwininfo -name Yakuake | grep "Yakuake" | sed -E 's/.*(0x[0-9]+).*/\1/g'`;
    fi
fi
