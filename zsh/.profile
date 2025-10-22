export DOTFILES_HOME=$HOME/.dotfiles
source "$HOME/.config/zsh/xdg.sh"
export PATH="$PATH:$DOTFILES_HOME/scripts"

case $(uname) in
Darwin) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
Linux) source "$XDG_CONFIG_HOME/zsh/env.sh" ;;
esac

source "$DOTFILES_HOME/zsh/.config/zsh/secret-env-vars.sh"
source "$XDG_CONFIG_HOME"/zsh/path.sh
source "$XDG_CONFIG_HOME"/zsh/gpg.sh

# This only works with my custom wrapper script, sorry, but feel free to use it.
# It's in under scripts/flutter. It uses asdf, if you don't, adjust it.
export FLUTTER_DEVICE_TIMEOUT=1

export PATH="$DOTFILES_HOME/scripts:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tamasbarta/.lmstudio/bin"
# End of LM Studio CLI section
