export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# only if we're running linux
if [ "$(uname)" = "Linux" ]; then
	export XDG_RUNTIME_DIR=/run/user/$UID
fi

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_CACHE_HOME"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GOPATH="$XDG_DATA_HOME"/go
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdfrc"
export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf"
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="${XDG_CONFIG_HOME:-$HOME/.config}/asdf/tool-versions"

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_USER_HOME=$HOME/.android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator
export ANDROID_AVD_HOME="$ANDROID_EMULATOR_HOME/avd"

export PUB_CACHE="$XDG_CACHE_HOME"/pub
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_DATA_HOME/dartServer"

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode

mkdir -p "$XDG_DATA_HOME"/wineprefixes
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$TERMINFO_DIRS:$XDG_DATA_HOME/terminfo:/usr/share/terminfo:/etc/terminfo"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
grep -q "^hsts-file = " "$WGETRC" && sed "s#^hsts-file = .*#hsts-file = $XDG_CACHE_HOME/wget-hsts#" -i "$WGETRC" || echo hsts-file \= "$XDG_CACHE_HOME"/wget-hsts >>"$WGETRC"
export LESSHISTFILE=-
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/default/config"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME"/solargraph # what's this?
export W3M_DIR="$XDG_DATA_HOME/w3m"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"

# Wasmtime
export WASMTIME_HOME="$HOME/.local/share/wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
