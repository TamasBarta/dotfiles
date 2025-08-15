export DOTFILES_HOME=$HOME/.dotfiles
source "$HOME/.config/zsh/xdg.sh"
export PATH="$PATH:$DOTFILES_HOME/.scripts"

case $(uname) in
Darwin) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
Linux) source "$XDG_CONFIG_HOME/zsh/env.sh" ;;
esac

source "$DOTFILES_HOME/zsh/.config/zsh/secret-env-vars.sh"
source "$XDG_CONFIG_HOME"/zsh/path.sh
source "$XDG_CONFIG_HOME"/zsh/gpg.sh
