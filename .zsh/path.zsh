# Setting up the path

export PATH="$PATH:$DOTFILES_HOME/scripts"

export GOPATH=$HOME/.gopath
export PATH="$PATH:${GOPATH//://bin:}/bin"

# Proguard
export PATH=$PATH:/opt/android-sdk/tools/proguard/bin
export PATH=$PATH:/opt/android-sdk/platform-tools
