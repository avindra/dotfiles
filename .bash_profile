export LS_OPTIONS="$LS_OPTIONS --color=always"

# Git aliases
# todo: move into config

alias status="git status"
alias diff="git diff --cached"
alias add="git add -u ."
alias unstage="git reset HEAD ."
alias pull="git pull --rebase"
alias push="git push"

# Platform-specific configurations.
# 1) OS X / iOS (Apple)
# 2) cygwin / Windows

uname=`uname`
if [[ "$uname" == "Darwin" ]]; then
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	export PS1="\h:\w \u\$ "
	# Make atom the editor for RN
	export EDITOR="atom"
elif [[ "$uname" == "MINGW64_NT-6.1" ]]; then
	cd ~/Dev 2> /dev/null
	. ~/.work_profile
	alias l='ls -alF'
fi

if [[ "$uname" != "Darwin" ]]; then
	alias grep="grep --color"
fi

# Java

export JAVA_HOME=/usr/java/latest
