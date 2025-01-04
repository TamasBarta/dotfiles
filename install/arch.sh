# Install packages

sudo pacman --noconfirm -Suyy git base-devel

if ! [ -x "$(command -v yay)" ]; then
	git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
	cd /tmp/yay-bin
	makepkg -is
	cd -
	rm -rf /tmp/yay-bin
fi

# common
yay --needed --noconfirm -S neovim tmux zsh unzip zip efibootmgr wmname dunst \
	network-manager-applet htop filelight playerctl \
	lazygit git-crypt bolt eza keyd darkman bluez \
	telegram-desktop spotifywm-git bitwarden-bin bc \
	jetbrains-toolbox nerd-fonts-iosevka inter-font \
	ttf-iosevka-aile insync bluez pavucontrol paprefs \
	android-tools android-udev android-sdk spicetify-cli spicetify-themes-git \
	brightnessctl firefox blueman jq go fzf xxd wezterm yazi \
	innoextract cabextract xp-pen-tablet flatpak docker docker-compose \
	goldwarden diffnav

# this shit has GPG keys often failing to import
yay --needed --noconfirm -S spotify

# pipewire version
yay --needed --noconfirm -S pipewire pipewire-pulse pipewire-jack-dropin pipewire-jack wireplumber

# Hyprland version
yay --needed --noconfirm -S rofi-wayland waybar slurp grim swappy wtype wl-clipboard hyprland hy3
