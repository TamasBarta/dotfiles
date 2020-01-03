#!/bin/bash

case $(cat /etc/*-release | grep ID_LIKE | grep -o "[a-z]*") in
  archlinux) source $DOTFILES_HOME/install/arch.sh ;;
  debian) source $DOTFILES_HOME/install/debian.sh ;;
esac

# Change default shell to zsh
chsh -s /usr/bin/zsh

stow -d $DOTFILES_HOME x
stow -d $DOTFILES_HOME bspwm
stow -d $DOTFILES_HOME polybar
stow -d $DOTFILES_HOME rofi
stow -d $DOTFILES_HOME ranger

