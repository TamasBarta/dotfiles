# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install zsh ruby

# Create symlinks
ln -s $DOTFILES_HOME/karabiner $HOME/.config/
ln -s $DOTFILES_HOME/yabai/.yabairc $DOTFILES_HOME/yabai/.skhdrc $HOME/

# Set up Übersicht
mkdir -p $HOME/Library/Application Support/Übersicht/widgets
git clone https://github.com/zzzeyez/pecan.git "$HOME/Library/Application Support/Übersicht/widgets/pecan"
ln -s "${HOME}/Library/Application Support/Übersicht/widgets/pecan/pecan-style" "/usr/local/bin/pecan-style"
