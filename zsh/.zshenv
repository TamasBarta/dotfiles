export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/history
mkdir -p $(dirname $HISTFILE)

mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh
# compinit -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION
