#!/bin/bash

xcode-select --install
sudo softwareupdate --install-rosetta --agree-to-license

# Install Homebrew
if [ -x "$(command -v brew)" ]; then
  echo "Homebrew is already installed."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Remove packages and taps that are not in the Brewfile
brew bundle cleanup --force --file "$DOTFILES_HOME/install/Brewfile"

# Install packages from Brewfile
brew bundle --file "$DOTFILES_HOME/install/Brewfile"

# Download proper Hungarian keyboard layout
wget -O - https://raw.githubusercontent.com/zaki/mac-hun-keyboard/master/Hungarian_Win.keylayout | sudo tee /Library/Keyboard\ Layouts/Hungarian_Win.keylayout

# Create symlinks
stow -d "$DOTFILES_HOME" karabiner
stow -d "$DOTFILES_HOME" yabai
stow -d "$DOTFILES_HOME" sketchybar

source macos-defaults.sh

echo "setenv UNAME Darwin" | sudo tee -a /etc/launchd.conf
