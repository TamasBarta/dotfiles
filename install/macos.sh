# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install zsh ruby

# Create symlinks
ln -s $DOTFILES_HOME/karabiner $HOME/.config/
ln -s $DOTFILES_HOME/yabai/.yabairc $DOTFILES_HOME/yabai/.skhdrc $HOME/