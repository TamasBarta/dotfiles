# Install packages

sudo pacman --noconfirm -Suyy git base-devel

git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
cd /tmp/yay-bin
makepkg -is
cd -
rm -rf /tmp/yay-bin

# common
yay --noconfirm -S neovim tmux zsh unzip zip efibootmgr wmname dunst \
	network-manager-applet htop filelight playerctl \
	telegram-desktop spotify spotifywm-git bitwarden-bin bc \
	rofi-lbonn-wayland-git jetbrains-toolbox nerd-fonts-iosevka \
	ttf-iosevka-aile insync bluez pavucontrol paprefs \
	android-tools android-udev android-sdk spicetify-cli spicetify-themes-git \
	brightnessctl firefox blueman keyd-git exa jq go fzf xxd

# pipewire version
yay --noconfirm -S pipewire pipewire-pulse pipewire-jack-dropin pipewire-jack pipewire-media-session

# Hyprland version
yay --noconfirm -S rofi-wayland waybar slurp grim swappy wtype wl-clipboard hyprland hy3
