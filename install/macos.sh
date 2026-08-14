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

# Add taps
# tunnelto
brew tap agrinman/tap
# borders, sketchybar, svim
brew tap felixkratz/formulae
# yabai, skhd
brew tap koekeishiya/formulae
# keyboardSwitcher
brew tap lutzifer/homebrew-tap

# Install packages
brew install zsh ruby stow homeassistant-cli bat tmux neovim lazygit topgrade lf yq jq xq sops scrcpy ripgrep eza dust fd fzf koekeishiya/formulae/yabai koekeishiya/formulae/skhd borders svim sketchybar buf bundletool chafa coreutils curl wget go gnupg htop kondo just onefetch qrencode shellcheck w3m graphite tunnelto pinentry-mac keyboardswitcher git-crypt bitwarden-cli gh luarocks git-delta awscli session-manager-plugin autoconf bison re2c gd libiconv libzip m4 android-platform-tools swiftlint swiftformat ctpv yt-dlp pandoc spicetify-cli mpv oh-my-posh kdoctor yazi unar gtk4 glow hexyl lazydocker firebase-cli graphviz tag imagemagick dos2unix ansible eza ripgrep fd lcov opencode btop herdr exiftool spotify_player iamb

brew install --cask raycast firefox wezterm slack spotify obsidian karabiner-elements bitwarden jetbrains-toolbox todoist hiddenbar betterdisplay figma bluesnooze obs droidcam-obs krita monitorcontrol iina anydesk home-assistant telegram-desktop daisydisk insync onlyoffice minisim tableplus unnaturalscrollwheels min brave-browser gpg-suite notion-calendar thunderbird muzzle viber syncthing minisim schildichat

brew install --cask font-jetbrains-mono-nerd-font font-monaspace-nerd-font font-blex-mono-nerd-font font-iosevka-nerd-font

# Download proper Hungarian keyboard layout
wget -O - https://raw.githubusercontent.com/zaki/mac-hun-keyboard/master/Hungarian_Win.keylayout | sudo tee /Library/Keyboard\ Layouts/Hungarian_Win.keylayout

# Create symlinks
stow -d "$DOTFILES_HOME" karabiner
stow -d "$DOTFILES_HOME" yabai
stow -d "$DOTFILES_HOME" sketchybar

source macos-defaults.sh

echo "setenv UNAME Darwin" | sudo tee -a /etc/launchd.conf
