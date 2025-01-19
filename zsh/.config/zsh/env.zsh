# Environment
# This file is sourced in Linux ONLY
while read -r l; do
    eval export $l
done < <(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

export ANDROID_HOME=$HOME/Android/Sdk
export CHROME_EXECUTABLE=$(which brave 2>/dev/null)
export SPICETIFY_INSTALL="$HOME/.spicetify"

# if [ -z "${SSH_AUTH_SOCK:+x}" ]; then eval $(ssh-agent); fi
