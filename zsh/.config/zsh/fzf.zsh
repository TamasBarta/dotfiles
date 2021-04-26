export FZF_DEFAULT_COMMAND="fd . $HOME"

FZF_HOME=$HOME/.local/share/fzf

if [ ! -e $FZF_HOME ]; then
    git clone https://github.com/junegunn/fzf.git $FZF_HOME
fi

# Put fzf binary in path
export PATH=$PATH:$FZF_HOME/bin

source $FZF_HOME/shell/completion.zsh
source $FZF_HOME/shell/key-bindings.zsh
