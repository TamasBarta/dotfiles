# Environment
while read -r l; do
    eval export $l
done < <(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

export CHROME_EXECUTABLE=$(which brave)
export GVT_DOM="0000:00"
export GVT_PCI="0000:00:02.0"
export GVT_GUID="3b0e5f82-d331-4485-82e5-63ccd2efc576"
export GVT_TYPE="i915-GVTg_V5_4"
