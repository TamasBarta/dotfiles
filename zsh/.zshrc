# Must be first
export TERM="xterm-256color"
export DOTFILES_HOME=$HOME/.dotfiles

source $DOTFILES_HOME/zsh/oh-my-zsh.zsh
source $DOTFILES_HOME/zsh/path.zsh
source $DOTFILES_HOME/zsh/aliases.zsh
source $DOTFILES_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_HOME/zsh/sdkman.zsh

case `uname` in
  Darwin) source $DOTFILES_HOME/zsh/macos.zsh ;;
  Linux) source $DOTFILES_HOME/zsh/linux.zsh ;;
esac
