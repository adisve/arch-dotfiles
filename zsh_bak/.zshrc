#
# ~/.zshrc
#
ZSH=/usr/share/oh-my-zsh/


# If not running interactively, don't do anything
[[ $- != *i* ]] && return 
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ ' 
export PATH="$PATH:/home/adis/.local/bin"
export PATH="$PATH:/home/adis/flutter_sdk/flutter/bin"
export PATH=$PATH:$HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export ZSH=/usr/share/oh-my-zsh
export DEFAULT_USER="adis"
EDITOR="nvim"
VISUAL="nvim" 

plugins=(archlinux 
	asdf 
	bundler 
	docker 
	jsontools 
	vscode 
	web-search 
	tig 
	gitfast 
	colored-man-pages 
	colorize 
	command-not-found 
	cp 
	dirhistory 
	autojump 
	sudo 
	zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

rule () {
	print -Pn '%F{blue}'
	local columns=$(tput cols)
	for ((i=1; i<=columns; i++)); do
	   printf "\u2588"
	done
	print -P '%f'
}

function _my_clear() {
	echo
	rule
	zle clear-screen
}
zle -N _my_clear
bindkey '^l' _my_clear

# Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
ranger-cd() {
	tempfile=$(mktemp)
	ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	cd -- "$(cat "$tempfile")"
	fi
	rm -f -- "$tempfile"
	# hacky way of transferring over previous command and updating the screen
	VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"