source $HOME/.profile

mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh
if [[ -o interactive ]]; then
  autoload -Uz compinit
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f "$HOME/.config/zsh/work.zsh" ]; then source $HOME/.config/zsh/work.zsh; fi

source $HOME/.config/zsh/zinit.zsh

source $HOME/.config/zsh/p10k.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/bindkey.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/vim.zsh

case `uname` in
  Darwin) source $HOME/.config/zsh/macos.zsh ;;
  Linux) source $HOME/.config/zsh/linux.zsh ;;
esac


if [[ -o interactive ]]; then
  compinit -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION
fi

