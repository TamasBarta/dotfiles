# Install packages

sudo pacman -Suyy
sudo pacman -S kitty nvim tmux zsh unzip zip stow xautomation efibootmgr bspwm sxhkd picom lxappearance qt5ct wmname dunst xcape

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -is
cd -
rm -rf yay


