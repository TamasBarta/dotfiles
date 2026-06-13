#!/bin/sh

cmd="$*"

pick_terminal() {
  case "$TERMINAL_EMULATOR" in
  foot | wezterm | ghostty)
    printf '%s\n' "$TERMINAL_EMULATOR"
    return 0
    ;;
  esac

  for t in foot wezterm ghostty; do
    if command -v "$t" >/dev/null 2>&1; then
      printf '%s\n' "$t"
      return 0
    fi
  done

  return 1
}

term=$(pick_terminal) || {
  echo "No supported terminal found (foot, wezterm, ghostty)" >&2
  exit 1
}

if [ -z "$cmd" ]; then
  case "$term" in
  foot) foot ;;
  wezterm) wezterm start ;;
  ghostty) ghostty ;;
  esac
  exit 0
fi

case "$term" in
foot) foot "$SHELL" -c "$cmd" ;;
wezterm) wezterm start -- "$SHELL" -c "$cmd" ;;
ghostty) ghostty -e "$SHELL" -c "$cmd" ;;
esac
