#!/bin/bash

# Check if git and stow is installed
if [ -x "$(command -v git)" ] && [ -x "$(command -v stow)" ]; then
  echo "Git and stow are already installed."
else
  # Try installing absolutely necessary packages
  if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install -y git stow
  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S --noconfirm git stow
  elif [ -x "$(command -v brew)" ]; then
    brew install git stow
  elif [ -x "$(command -v pkg)" ]; then
    sudo pkg install git
  else
    echo "No package manager found. Please install git and stow."
    exit 1
  fi
fi

DOTFILES_HOME=$HOME/.dotfiles
REPOSITORY=https://gitlab.com/TamasBarta/dotfiles.git

git clone --recurse-submodules -j8 $REPOSITORY $DOTFILES_HOME

case `uname` in
  Darwin) source $DOTFILES_HOME/install/macos.sh ;;
  Linux) source $DOTFILES_HOME/install/linux.sh ;;
esac

stow -d $DOTFILES_HOME zsh
stow -d $DOTFILES_HOME tmux
stow -d $DOTFILES_HOME nvim
stow -d $DOTFILES_HOME git
stow -d $DOTFILES_HOME wezterm
stow -d $DOTFILES_HOME asdf

# bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

