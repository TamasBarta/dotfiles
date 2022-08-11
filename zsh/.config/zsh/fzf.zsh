export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_ALT_C_COMMAND="fd --type d -i --hidden --color=always --ignore-file ~/.config/git/ignore -E Library"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

FZF_HOME=$HOME/.local/share/fzf

if [ ! -e $FZF_HOME ]; then
    git clone https://github.com/junegunn/fzf.git $FZF_HOME
fi

# Put fzf binary in path
export PATH=$PATH:$FZF_HOME/bin

source $FZF_HOME/shell/completion.zsh
source $FZF_HOME/shell/key-bindings.zsh
