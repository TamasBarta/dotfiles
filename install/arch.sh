# Install packages

sudo pacman -Suyy git

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -is
cd -
rm -rf /tmp/yay

yay -S kitty nvim tmux zsh unzip zip stow xautomation efibootmgr bspwm sxhkd picom lxappearance qt5ct wmname dunst xcape base-devel go xdotool adapta-gtk-theme network-manager-applet htop filelight kvantum-qt5 xorg-xdpyinfo playerctl libratbag xorg-input telegram-desktop spotify spotifywm-git bitwarden-bin multilockscreen bc rofi jetbrains-toolbox fzf xorg-xrandr xsel xclip xorg-xrdb nerd-fonts-iosevka ttf-iosevka-aile feh insync polybar papirus-icon-theme pulseaudio bluez pavucontrol paprefs android-tools android-udev android-sdk spicetify-cli spicetify-themes-git xorg-xsetroot xtitle

yay -S sway rofi-lbonn-wayland-git waybar slurp grim jq
