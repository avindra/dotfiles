export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings

# Platform-specific configurations.
# 1) OS X / iOS (Apple)
# 2) cygwin / Windows

uname=`uname`
if [[ "$uname" == "Darwin" ]]; then
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	source /usr/local/etc/bash_completion.d/git-prompt.sh
	GIT_PS1_SHOWDIRTYSTATE=true

	export PS1='\u@\h:\w $(__git_ps1) \$ '

	export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"
elif [[ "$uname" == "MINGW64_NT-6.1" ]]; then
	cd ~/Dev 2> /dev/null
	. ~/.work_profile
	alias l='ls -alF'
fi

alias grep="grep -n --color"

# Alias wget to curl if not available
 
hash wget &> /dev/null
if [[ $? -eq 1 ]]; then
	alias wget="curl -L -O --retry 999 --retry-max-time 0 -C -"
fi
