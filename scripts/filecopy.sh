osascript \
	-e 'on run args' \
	-e 'set the clipboard to POSIX file (first item of args)' \
	-e end \
	"$(realpath "$1")"
