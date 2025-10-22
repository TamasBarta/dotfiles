source "$HOME/.dotfiles/zsh/.config/zsh/secret-env-vars.sh"

JSON=$(curl https://n8n.bartatamas.hu/webhook/get-next-calendar-entry -u "$N8N_WEBHOOK_GUARD_USERNAME:$N8N_WEBHOOK_GUARD_PASSWORD")
START="$(echo "$JSON" | jq -r '.startTime')"
SUMMARY="$(echo "$JSON" | jq -r '.summary')"
COLOR="$(echo "$JSON" | jq -r '.color')"

LABEL="$START | $SUMMARY"

sketchybar --set "$NAME" update_freq=300 icon="󰃰" label="$LABEL" click_script="open -a 'Notion Calendar.app'" icon.color="0xff$COLOR"
