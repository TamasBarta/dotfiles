#!/bin/bash

case $(cat /etc/*-release | awk -F '=' '{ if ($1 == "ID") print $2 }') in
  arch) source $DOTFILES_HOME/install/arch.sh ;;
  debian) source $DOTFILES_HOME/install/debian.sh ;;
  *) source $DOTFILES_HOME/install/android.sh ;;
esac

stow -d $DOTFILES_HOME x
# stow -d $DOTFILES_HOME bspwm
# stow -d $DOTFILES_HOME polybar
stow -d $DOTFILES_HOME rofi
stow -d $DOTFILES_HOME ranger
stow -d $DOTFILES_HOME fusuma
stow -d $DOTFILES_HOME sway
stow -d $DOTFILES_HOME waybar
stow -d $DOTFILES_HOME systemd
stow -d $DOTFILES_HOME dunst

