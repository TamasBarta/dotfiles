# Setting up the path

export GOPATH=$HOME/.gopath
export PATH="$PATH:${GOPATH//://bin:}/bin"

PATH="$PATH:$HOME/.config/variety/scripts"
PATH="$PATH:$HOME/.apps/scripts"
PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin"

# export PATH="$HOME/.phpbrew/php/php-5.5.24/bin:$HOME/.phpbrew/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.apps/adt-bundle-linux-x86_64-20140321/sdk/platform-tools:$HOME/.apps/adt-bundle-linux-x86_64-20140321/sdk/tools:$HOME/.composer/vendor/bin:$HOME/.apps/scripts"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH

# Proguard
export PATH=$PATH:/opt/android-sdk/tools/proguard/bin
export PATH=$PATH:/opt/android-sdk/platform-tools
