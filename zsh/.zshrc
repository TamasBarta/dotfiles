# Must be first
# export TERM="xterm-256color"
export DOTFILES_HOME=$HOME/.dotfiles

if [ -f "$DOTFILES_HOME/.zsh/work.zsh" ]; then source $DOTFILES_HOME/.zsh/work.zsh; fi

source $DOTFILES_HOME/.zsh/oh-my-zsh.zsh
source $DOTFILES_HOME/.zsh/p10k.zsh
source $DOTFILES_HOME/.zsh/path.zsh
source $DOTFILES_HOME/.zsh/fzf.zsh
source $DOTFILES_HOME/.zsh/aliases.zsh
source $DOTFILES_HOME/.zsh/functions.zsh
source $DOTFILES_HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES_HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_HOME/.zsh/gradle-completion.zsh
source $DOTFILES_HOME/.zsh/vim.zsh

case `uname` in
  Darwin) source $DOTFILES_HOME/.zsh/macos.zsh ;;
  Linux) source $DOTFILES_HOME/.zsh/linux.zsh ;;
esac

source $DOTFILES_HOME/.zsh/sdkman.zsh
source $DOTFILES_HOME/.zsh/rbenv.zsh
source $DOTFILES_HOME/.zsh/nodenv.zsh
source $DOTFILES_HOME/.zsh/rust.zsh
source $DOTFILES_HOME/.zsh/flutter.zsh
source $DOTFILES_HOME/.zsh/autocompletion.zsh
