#!/bin/bash

xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add taps
# gomuks
brew tap aaronraimist/tap
# tunnelto
brew tap agrinman/tap
# borders, sketchybar, svim
brew tap felixkratz/formulae
# yabai, skhd
brew tap koekeishiya/formulae
# mopidy
# brew tap mopidy/mopidy
# graphite
brew tap withgraphite/tap
# zathura
brew tap zegervdv/zathura

# install Zathura with macOS patch
brew install girara --HEAD
brew install zathura --HEAD
mkdir -p "$(brew --prefix zathura)/lib/zathura"
ln -s "$(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib" "$(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib"

# Install packages
brew install zsh ruby stow homeassistant-cli bat tmux neovim lazygit topgrade lf zathura yq jq xq sops scrcpy ripgrep eza dust fd fzf zathura zathura-pdf-poppler yabai skhd borders svim sketchybar buf bundletool chafa coreutils curl wget go gnupg htop kondo just onefetch qrencode shellcheck w3m graphite tunnelto gomuks

brew install --cask raycast firefox wezterm element slack spotify obsidian notion calibre signal karabiner-elements bitwarden jetbrains-toolbox todoist hiddenbar betterdisplay figma bluesnooze obs droidcam-obs krita monitorcontrol iina anydesk home-assistant telegram-desktop daisydisk insync onlyoffice minisim tableplus unnaturalscrollwheels min brave-browser

# Create symlinks
stow -d "$DOTFILES_HOME" karabiner
stow -d "$DOTFILES_HOME" yabai
stow -d "$DOTFILES_HOME" sketchybar

source "$DOTFILES_HOME"/macos/defaults.sh

echo "setenv UNAME Darwin" | sudo tee -a /etc/launchd.conf
