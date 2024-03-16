LFCD="$GOPATH/src/github.com/gokcehan/lf/etc/lfcd.sh"  # source
LFCD="${XDG_CONFIG_DIR:-$HOME/.config}/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi


alias lf=lfcd
