#!/bin/bash

mkdir "$HOME/.local/share/dark-mode.d/"
mkdir "$HOME/.local/share/light-mode.d/"

case $(cat /etc/*-release | awk -F '=' '{ if ($1 == "ID") print $2 }' | tr -d "\"") in
arch | manjaro-arm | archarm)
	source "$DOTFILES_HOME/install/arch.sh"
	;;
fedora | fedora-asahi-remix)
	source "$DOTFIELS_HOME/install/fedora.sh"
	;;
ubuntu | debian)
	source "$DOTFILES_HOME/install/debian.sh"
	;;
*) source "$DOTFILES_HOME/install/android.sh" ;;
esac

sudo usermod -aG docker "$USER"
sudo mkdir -p /etc/keyd
sudo cp "$DOTFILES_HOME"/keyd/etc/keyd/default.conf /etc/keyd/default.conf

stow -d "$DOTFILES_HOME" rofi
stow -d "$DOTFILES_HOME" hyprland
stow -d "$DOTFILES_HOME" waybar
stow -d "$DOTFILES_HOME" systemd
stow -d "$DOTFILES_HOME" dunst
stow -d "$DOTFILES_HOME" xdg-desktop-portal
stow -d "$DOTFILES_HOME" darkman

sudo systemctl enable --now keyd
sudo systemctl enable --now bluetooth
