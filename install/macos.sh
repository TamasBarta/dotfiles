#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install zsh ruby

# Create symlinks
ln -s $DOTFILES_HOME/karabiner $HOME/.config/
ln -s $DOTFILES_HOME/yabai/.yabairc $DOTFILES_HOME/yabai/.skhdrc $HOME/

# Set up Übersicht
mkdir -p $HOME/Library/Application Support/Übersicht/widgets
git clone https://github.com/zzzeyez/pecan.git "$HOME/Library/Application Support/Übersicht/widgets/pecan"
ln -s "${HOME}/Library/Application Support/Übersicht/widgets/pecan/pecan-style" "/usr/local/bin/pecan-style"

# Set shell to zsh
chsh -s /bin/zsh


# Defaults settings

# Disable automatically rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
