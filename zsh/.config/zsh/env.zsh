# Environment
# This file is sourced in Linux ONLY
while read -r l; do
    eval export $l
done < <(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

export CHROME_EXECUTABLE=$(which brave 2>/dev/null)
export GVT_DOM="0000:00"
export GVT_PCI="0000:00:02.0"
export GVT_GUID="3b0e5f82-d331-4485-82e5-63ccd2efc576"
export GVT_TYPE="i915-GVTg_V5_4"
export SPICETIFY_INSTALL="$HOME/.spicetify"

# if [ -z "${SSH_AUTH_SOCK:+x}" ]; then eval $(ssh-agent); fi
