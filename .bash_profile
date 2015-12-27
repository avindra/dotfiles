export LS_OPTIONS="$LS_OPTIONS --color=always"


# The best git aliases in town.
# If you disagree, you are obviously wrong.

alias status="git status"
alias diff="git diff --cached"
alias add="git add -u ."
alias unstage="git reset HEAD ."
alias pull="git pull --rebase"
alias push="git push"

# Mac OS X stuff

export LSCOLORS="ExFxCxDxBxegedabagacad"
export CLICOLOR=1

if [[ `uname` == "Darwin" ]]; then
	export PS1="\h:\w \u\$ "
fi

export EDITOR="atom"
