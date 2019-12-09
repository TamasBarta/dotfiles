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
stow -d $DOTFILES_HOME vim
stow -d $DOTFILES_HOME git
stow -d $DOTFILES_HOME kitty

vim +PluginInstall +qall

# Install SDKMAN!
curl -s "https://get.sdkman.io" | bash
# Revert its modifications, since those are already in $DOTFILES_HOME/.zsh/sdkman.zsh
git -C $DOTFILES_HOME checkout -- $DOTFILES_HOME/zsh/.zshrc
