# Must be first
# export TERM="xterm-256color"
export DOTFILES_HOME=$HOME/.dotfiles
source $HOME/.config/zsh/xdg.sh

case `uname` in
  Darwin) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
  Linux) source $HOME/.config/zsh/env.zsh ;;
esac

if [ -f "$HOME/.config/zsh/work.zsh" ]; then source $HOME/.config/zsh/work.zsh; fi

source $HOME/.config/zsh/zinit.zsh
# source $HOME/.config/zsh/antigen.zsh

source $HOME/.config/zsh/p10k.zsh
source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/bindkey.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/vim.zsh
source $HOME/.config/zsh/gpg.zsh

case `uname` in
  Darwin) source $HOME/.config/zsh/macos.zsh ;;
  Linux) source $HOME/.config/zsh/linux.zsh ;;
esac
