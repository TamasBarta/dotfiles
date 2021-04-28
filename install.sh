#!/bin/bash

DOTFILES_HOME=$HOME/.dotfiles
REPOSITORY=https://gitlab.com/TamasBarta/dotfiles.git

git clone --recurse-submodules -j8 $REPOSITORY $DOTFILES_HOME

$DOTFILES_HOME/.zsh/fzf/install --bin

case `uname` in
  Darwin) source $DOTFILES_HOME/install/macos.sh ;;
  Linux) source $DOTFILES_HOME/install/linux.sh ;;
esac

stow -d $DOTFILES_HOME zsh
stow -d $DOTFILES_HOME tmux
stow -d $DOTFILES_HOME nvim
stow -d $DOTFILES_HOME git
stow -d $DOTFILES_HOME kitty
stow -d $DOTFILES_HOME asdf

nvim +PlugInstall +qall

