# Setting up the path

export PATH="$PATH:$DOTFILES_HOME/scripts"

export PATH="$PATH:$HOME/.pub-cache/bin"
export GOPATH=$HOME/.gopath
export PATH="$PATH:${GOPATH//://bin:}/bin"

# Proguard
export PATH=$PATH:$HOME/Library/Android/sdk/tools/proguard/bin
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools/bin
export PATH=$PATH:/opt/android-sdk/tools/proguard/bin
export PATH=$PATH:/opt/android-sdk/platform-tools
