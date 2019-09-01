#!/bin/bash

DOTFILES_HOME=$HOME/.dotfiles
REPOSITORY=https://gitlab.com/TamasBarta/dotfiles.git

git clone --recurse-submodules -j8 $REPOSITORY $DOTFILES_HOME

$DOTFILES_HOME/zsh/fzf/install --bin

[ -f $HOME/.zshrc ] && echo "Backing up previous .zshrc as .zshrc.bak" && mv $HOME/.zshrc{,.bak}
[ -f $HOME/.tmux.conf ] && echo "Backing up previous .tmux.conf as .tmux.conf.bak" && mv $HOME/.tmux.conf{,.bak}
[ -f $HOME/.vimrc ] && echo "Backing up previous .vimrc as .vimrc.bak" && mv $HOME/.vimrc{,.bak}
[ -f $HOME/.vim ] && echo "Backing up previous .vim as .vim.bak" && mv $HOME/.vim{,.bak}
[ -f $HOME/.gitconfig ] && echo "Backing up previous .gitconfig as .gitconfig.bak" && mv $HOME/.gitconfig{,.bak}

ln -s $DOTFILES_HOME/zsh/.zshrc $HOME/.zshrc
ln -s $DOTFILES_HOME/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_HOME/vim/.vimrc $HOME/.vimrc
ln -s $DOTFILES_HOME/vim/.vim $HOME/.vim
ln -s $DOTFILES_HOME/git/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES_HOME/kitty $HOME/.config/

vim +PluginInstall +qall

# Install SDKMAN!
curl -s "https://get.sdkman.io" | bash
# Revert its modifications, since those are already in $DOTFILES_HOME/zsh/sdkman.zsh
git -C $DOTFILES_HOME checkout -- $DOTFILES_HOME/zsh/.zshrc

case `uname` in
  Darwin) source $DOTFILES_HOME/install/macos.sh ;;
  Linux) source $DOTFILES_HOME/install/linux.sh ;;
esac
