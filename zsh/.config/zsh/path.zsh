# Setting up the path

export PATH="$DOTFILES_HOME/scripts:$PATH"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cache/pub/bin"
export PATH="$PATH:${GOPATH//://bin:}/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:${XDG_DATA_HOME}/npm/bin"

# Proguard
export PATH=$PATH:$HOME/Library/Android/sdk/tools/proguard/bin
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools/bin
export PATH=$PATH:/opt/android-sdk/tools/proguard/bin
export PATH=$PATH:/opt/android-sdk/platform-tools
export PATH=$PATH:/opt/android-sdk/tools
export PATH=$PATH:/opt/android-sdk/tools/bin
export PATH="/opt/homebrew/Caskroom/android-sdk/4333796/platform-tools/:$PATH"
