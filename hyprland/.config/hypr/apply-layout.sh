# Ideapad 5 built-in
built_in="Thermotrex Corporation TL140ADXP22-0"
is_closed=$(grep -c closed /proc/acpi/button/lid/*/state)
if [[ $is_closed -eq 1 ]]; then
	hyprctl --instance 0 keyword monitor "desc:$built_in,disable"
else
	hyprctl keyword monitor "desc:$built_in,highrr,1000x1080,2"
fi

# Samsung ultrawide
ultrawide="Samsung Electric Company C34J79x H4ZN101074"
hyprctl keyword monitor "desc:$ultrawide,highrr,0x0,1.3333333"

# AOC 4K
secondary="AOC U28G2G6B PPYM9JA002130"
hyprctl keyword monitor "desc:$secondary,highres,2583x0,2"

# AOC 4K Office
office="AOC U2790B 0x0000437C"
hyprctl keyword monitor "desc:$office,highres,560x0,2"

# XP-Pen Artist 13
tablet="UGD CD130FH 20210908"
hyprctl keyword monitor "desc:$tablet,highres,2440x1080,1"

# TLC television
television="Technical Concepts Ltd Beyond TV 0x00010000"
television="MS Telematica MStar Demo 0x00000001"
hyprctl keyword monitor "desc:$television,highrr,1000x360,2"

numberOfWorkspacesToMove=8

for i in $(seq 1 $numberOfWorkspacesToMove); do
	hyprctl --instance 0 dispatch moveworkspacetomonitor "$i desc:$ultrawide"
	hyprctl --instance 0 dispatch moveworkspacetomonitor "$i desc:$office"
done
hyprctl --instance 0 dispatch moveworkspacetomonitor "9 desc:$built_in"
hyprctl --instance 0 dispatch moveworkspacetomonitor "9 desc:$secondary"
hyprctl --instance 0 dispatch moveworkspacetomonitor "9 desc:$tablet"

systemctl --user try-restart hyprpaper.service
