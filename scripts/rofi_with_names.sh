#!/usr/bin/env bash

declare -A arr=()
declare -A seen=()
while IFS='|' read -r b a; do
  if [[ "${seen[$a]+_}" ]]; then
    # Duplicate display key — disambiguate all entries with this key
    if [[ ${seen[$a]} -eq 1 ]]; then
      # Second occurrence: rename the first entry too
      existing_val="${arr[$a]}"
      unset "arr[$a]"
      arr["$a ($existing_val)"]="$existing_val"
    fi
    arr["$a ($b)"]="$b"
    seen[$a]=$((seen[$a] + 1))
  else
    seen[$a]=1
    arr["$a"]="$b"
  fi
done

if command -v rofi >/dev/null 2>&1; then
  val=$(
    IFS=$'\n'
    echo "${!arr[*]}" | rofi -dmenu -i "$@"
  )
else
  tmpfile=$(mktemp /tmp/rofiwithnames.XXXXXX) || exit 1
  val=$(
    IFS=$'\n'
    echo "${!arr[*]}"
  )
  # make wezterm start output whatever the stdout of it runs
  term.sh zsh -ilc "echo -ne \"\\033]0;floatterm\\a\";echo \"$val\" | fzf --height=100% --reverse --border --prompt='Choose an option: ' > $tmpfile" 2>/dev/null
  val=$(cat "$tmpfile")
  rm -f "$tmpfile"
fi

if [ "$val" = "" ]; then
  exit 1
fi

echo "${arr[$val]}"
