# Linux specific stuff

alias open=xdg-open

# Loading desktop environment specific stuff

case $DESKTOP_SESSION in
    plasma) source $DOTFILES_HOME/zsh/.config/zsh/kde.zsh ;;
    /usr/share/xsessions/plasma) source $DOTFILES_HOME/zsh/.config/zsh/kde.zsh ;;
    *)
esac

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }


if [ -z $DISPLAY ] && [[ "$(tty)" == "/dev/tty1" ]]; then
  # exec sway --my-next-gpu-wont-be-nvidia
  # exec sway --unsupported-gpu
fi
