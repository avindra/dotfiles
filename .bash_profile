export LS_OPTIONS="$LS_OPTIONS --color=always"

# The best git aliases in town.
# If you disagree, you are obviously wrong.

alias status="git status"
alias diff="git diff --cached"
alias add="git add -u ."
alias unstage="git reset HEAD ."
alias pull="git pull --rebase"
alias push="git push"

# OS X / iOS (Apple) stuff

if [[ `uname` == "Darwin" ]]; then
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	export PS1="\h:\w \u\$ "
	# Make atom the editor for RN
	export EDITOR="atom"
fi

# Java

export JAVA_HOME=/usr/java/latest
