# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set oh my zsh theme
ZSH_THEME="afowler"

# set oh my zsh plugins
plugins=(gitfast zsh-autocomplete fzf)

source $ZSH/oh-my-zsh.sh

# Set vi mode - seemed to play nicer than using zsh-vi-mode plugin
bindkey -v

# Set default editor to nvim
export EDITOR=nvim

# Source fzf zsh configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Extra fzf config
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--multi --height 50% --border --reverse"

# Useful git diff preview using fzf
fd() {
	preview="git diff $@ --color=always -- {-1}"
	git diff $@ --name-only | fzf -m --ansi --preview $preview --preview-window wrap
}

# Enable zsh autocompletion
autoload -Uz compinit
compinit
