# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each folder is a stow package — `stow -d ~/.dotfiles <package>` creates symlinks from the package into `$HOME`.

## Installation

```sh
curl https://gitlab.com/TamasBarta/dotfiles/raw/master/install.sh | bash
```

The installer clones the repo, then runs a platform-specific script.

## Usage

```sh
stow -d ~/.dotfiles zsh       # symlink all files in zsh/ to $HOME
stow -d ~/.dotfiles -D zsh    # remove symlinks
```

## Packages

| Folder | Description | Maintained |
|---|---|---|
| `aerc` | Aerc email client config | 🟢 |
| `aerospace` | Aerospace window manager (macOS) | 🟡 |
| `asdf` | ASDF version manager config | 🟢 |
| `bat` | Bat (cat with syntax highlighting) config | 🔴 |
| `btop` | Btop system monitor config | 🟢 |
| `darkman` | Dark mode manager config | 🟡 |
| `dunst` | Dunst notification daemon config | 🟡 |
| `fastfetch` | Fastfetch system info config | 🟢 |
| `foot` | Foot terminal emulator config | 🟢 |
| `ghostty` | Ghostty terminal emulator config | 🟢 |
| `git` | Git config | 🟢 |
| `hyprland` | Hyprland compositor config | 🟢 |
| `iamb` | Iamb Matrix client config | 🟡 |
| `jetbrains` | JetBrains IDE settings | 🟡 |
| `kanshi` | Kanshi output management config | 🟡 |
| `karabiner` | Karabiner-Elements keyboard customizer (macOS) | 🟡 |
| `keyd` | Keyd keyboard remapping daemon config | 🟡 |
| `lazygit` | Lazygit TUI config | 🔴 |
| `mpv` | MPV media player config | 🟡 |
| `newsboat` | Newsboat RSS reader config | 🔴 |
| `niri` | Niri scrollable-tiling WM config | 🟢 |
| `noctalia` | Noctalia shell config | 🔴 |
| `nvim` | Neovim config using LazyVim | 🟢 |
| `rofi` | Rofi launcher config | 🟢 |
| `sketchybar` | SketchyBar status bar (macOS) | 🟢 |
| `spotify` | Spotify related utilities' configs. spotify_player, spotifyd | 🟢 |
| `sway` | Sway WM config | 🟢 |
| `systemd` | Systemd user service units | 🟡 |
| `termux` | Termux on Android config | 🔴 |
| `tmux` | Tmux config | 🔴 |
| `topgrade` | Topgrade upgrade-all tool config | 🔴 |
| `tridactyl` | Tridactyl browser extension config | 🟢 |
| `waybar` | Waybar status bar config | 🟢 |
| `wezterm` | WezTerm terminal emulator config | 🟢 |
| `wlr-which-key` | Wlr-which-key config | 🟢 |
| `xdg-desktop-portal` | XDG Desktop Portal config | 🟢 |
| `yabai` | Yabai tiling WM (macOS) | 🟢 |
| `yazi` | Yazi file manager config | 🟢 |
| `zathura` | Zathura PDF viewer config | 🟢 |
| `zsh` | Zsh config | 🟢 |

## Supported platforms

| Platform | Distro script | Default extra stow packages |
|---|---|---|
| macOS | `install/macos.sh` | `karabiner`, `yabai`, `sketchybar` |
| Arch Linux | `install/arch.sh` | `rofi`, `hyprland`, `waybar`, `systemd`, `dunst`, `xdg-desktop-portal`, `darkman` |
| Fedora | `install/fedora.sh` | (same as Arch) |
| Debian/Ubuntu | `install/debian.sh` | (same as Arch) |
| Termux/Android | `install/android.sh` | `termux`, `neofetch` |

On every platform the common stow packages are applied first: `zsh`, `bat`, `tmux`, `nvim`, `lazygit`, `git`, `wezterm`, `asdf`, `topgrade`, `yazi`, `zathura`, `tridactyl`, `jetbrains`, `spotify`, `fastfetch`, `newsboat`, `neomutt`, `mpv`.
