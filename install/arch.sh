# Install packages

sudo pacman --noconfirm -Suyy git go

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -is
cd -
rm -rf /tmp/yay

# common
yay --noconfirm -S kitty neovim tmux zsh unzip zip stow efibootmgr qt5ct wmname dunst base-devel go adapta-gtk-theme network-manager-applet htop filelight kvantum-qt5 playerctl libratbag telegram-desktop spotify spotifywm-git bitwarden-bin bc rofi-lbonn-wayland-git jetbrains-toolbox fzf nerd-fonts-iosevka ttf-iosevka-aile insync papirus-icon-theme bluez pavucontrol paprefs android-tools android-udev android-sdk spicetify-cli spicetify-themes-git brightnessctl firefox blueman keyd-git

# pulseaudio version
# yay --noconfirm -S pulseaudio

# pipewire version
yay --noconfirm -S pipewire pipewire-pulse pipewire-jack-dropin pipewire-jack pipewire-media-session

# bspwm version
# yay --noconfirm -S bspwm sxhkd picom lxappearance xautomation xdotool xorg-xdpyinfo xorg-input multilockscreen xorg-xrandr xsel xclip xorg-xrdb feh polybar xorg-xsetroot xtitle

# sway version
yay --noconfirm -S sway rofi-lbonn-wayland-git waybar slurp grim jq swappy wtype wl-clipboard
