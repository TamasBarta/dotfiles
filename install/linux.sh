#!/bin/bash

case $(cat /etc/*-release | awk -F '=' '{ if ($1 == "ID") print $2 }' | tr -d "\"") in
arch | manjaro-arm | archarm)
	source $DOTFILES_HOME/install/arch.sh
	;;
debian) source $DOTFILES_HOME/install/debian.sh ;;
*) source $DOTFILES_HOME/install/android.sh ;;
esac

stow -d $DOTFILES_HOME rofi
stow -d $DOTFILES_HOME hyprland
stow -d $DOTFILES_HOME waybar
stow -d $DOTFILES_HOME systemd
stow -d $DOTFILES_HOME dunst
stow -d $DOTFILES_HOME xdg-desktop-portal
stow -d $DOTFILES_HOME darkman
