# Download antigen
if [ ! -e "$XDG_DATA_HOME/antigen.zsh" ]; then
  curl -L git.io/antigen > "$XDG_DATA_HOME/antigen.zsh"
fi
# Load it
source "$XDG_DATA_HOME/antigen.zsh"

# Load plugins

antigen use ohmyzsh

antigen bundle git
antigen bundle romkatv/powerlevel10k

antigen theme amuse

antigen apply
