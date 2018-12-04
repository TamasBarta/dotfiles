# Linux specific stuff

# Loading desktop environment specific stuff

case $DESKTOP_SESSION in
    plasma) source $DOTFILES_HOME/zsh/kde.zsh ;;
    *)
esac
