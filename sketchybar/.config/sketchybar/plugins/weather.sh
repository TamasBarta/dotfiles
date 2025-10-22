map_weather_icon() {
	local emoji="$1"
	case "$emoji" in
	"☀️" | "🌞") echo "󰖙" ;;
	"🌤️") echo "󰼷" ;;
	"⛅️") echo "󰖕" ;;
	"☁️" | "🌥️") echo "󰖐" ;;
	"🌦") echo "" ;;
	"🌧️") echo "󰖖" ;;
	"⛈️") echo "󰖓" ;;
	"🌨️") echo "󰖒" ;;
	"🌫️") echo "󰖑" ;;
	"🌪️") echo "󰢘" ;;
	"🌈") echo "🌈" ;;
	*) echo "$emoji" ;;
	esac
}

WEATHER=$(curl wttr.in/Budapest\?format=1)
ICON="$(echo "$WEATHER" | head -c 6 | tr -d ' ')"
ICON="$(map_weather_icon "$ICON")"
TEMP="$(echo "$WEATHER" | cut -c 2- | tr -d '+ ')"

sketchybar --set "$NAME" update_freq=300 icon="$ICON" label="$TEMP" click_script="open -a Weather.app"
