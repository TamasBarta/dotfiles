declare -A ZINIT

ZINIT[BIN_DIR]=$HOME/.local/share/zinit/bin
ZINIT[HOME_DIR]=$HOME/.local/share/zinit

if [ ! -e "${ZINIT[HOME_DIR]}" ]; then
    mkdir $ZINIT[HOME_DIR]
    git clone https://github.com/zdharma/zinit.git $ZINIT[BIN_DIR]
fi

source $ZINIT[BIN_DIR]/zinit.zsh


zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZ::plugins/gradle
zinit pack for fzf



# Load core OMZ snippets
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# Load OMZ plugins
zinit wait lucid for \
    OMZ::plugins/sudo/sudo.plugin.zsh \
    OMZ::plugins/fzf/fzf.plugin.zsh

# Load plugins with completion
zinit wait lucid for \
    OMZ::plugins/git/git.plugin.zsh\
    light-mode @asdf-vm/asdf
zinit cdclear -q

zinit ice wait lucid blockf as"program" pick"wd.sh" mv"_wd.sh -> _wd" atload="wd() { source wd.sh }"
zinit light mfaerevaag/wd

# Load completions
zinit wait lucid as"completion" for \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
    https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose \
    https://github.com/TamasBarta/gradle-completion/blob/use-gradle-user-home-env-var/_gradle

# Fast-syntax-highlighting & autosuggestions
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

zinit ice wait'!' lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

