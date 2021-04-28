# Install packages

sudo pacman -Suyy git

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -is
cd -
rm -rf /tmp/yay

# common
yay -S kitty nvim tmux zsh unzip zip stow efibootmgr qt5ct wmname dunst base-devel go adapta-gtk-theme network-manager-applet htop filelight kvantum-qt5 playerctl libratbag telegram-desktop spotify spotifywm-git bitwarden-bin bc rofi-lbonn-wayland-git jetbrains-toolbox fzf nerd-fonts-iosevka ttf-iosevka-aile insync papirus-icon-theme pulseaudio bluez pavucontrol paprefs android-tools android-udev android-sdk spicetify-cli spicetify-themes-git brightnessctl

# pulseaudio version
yay -S pulseaudio

# pipewire version
yay -S pipewire pipewire-pulse pipewire-jack-dropin pipewire-jack pipewire-media-session

# bspwm version
# yay -S bspwm sxhkd picom lxappearance xautomation xcape xdotool xorg-xdpyinfo xorg-input multilockscreen xorg-xrandr xsel xclip xorg-xrdb feh polybar xorg-xsetroot xtitle

# sway version
yay -S sway rofi-lbonn-wayland-git waybar slurp grim jq swappy
