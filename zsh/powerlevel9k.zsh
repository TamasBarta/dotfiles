# Powerlevel9k settings

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

local user_symbol="$"
local user_color="blue"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol="#"
    user_color="red"
fi

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{black}%K{$user_color}%} $user_symbol %{%f%k%F{$user_color}%} %{%f%}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{$user_color}%} $user_symbol %{%f%}"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{black}%K{$user_color}%} $user_symbol %{%f%k%F{$user_color}%} %{%f%}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{$user_color}%} $user_symbol %{%f%}"

