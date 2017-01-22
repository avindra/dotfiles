export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings

# Fuzzy finder uses git ls-tree by default (fast)
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

# Duplicate in CTRL + T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Less options
export LESS="-RFX"

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\u@\h:\w $(__git_ps1) \$ '

if [[ $HOSTNAME == "avin-linux" ]]; then
	. ~/.work_profile
	export TERMINAL="xfce4-terminal"
	
	# Save history immediately
	shopt -s histappend
	PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
fi

# Platform-specific configurations.
# 1) OS X / iOS (Apple)
# 2) cygwin / Windows

uname=`uname`
if [[ "$uname" == "Darwin" ]]; then
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	# fix broken crontab editing on macos
	alias crontab="VIM_CRONTAB=true crontab"


	source /usr/local/etc/bash_completion
	source /usr/local/etc/bash_completion.d/git-prompt.sh

	alias ldd='otool -L'

	export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"

	togglewifi() {
		echo -n "Wifi coming down ..."
		networksetup -setairportpower en0 off
		echo "done"
		sleep 3
		echo -n "Wifi coming up..."
		networksetup -setairportpower en0 on
		echo "done"
	}

	export -f togglewifi

	. ~/.work_profile
	export PATH="$PATH:${HOME}/bin"
	alias l="ls -alF"
	alias update="brew update && brew upgrade && brew cu"
elif [[ "$uname" == "MINGW64_NT-6.1" ]]; then
	cd ~/Dev 2> /dev/null
	alias l='ls -alF'
fi

alias grep="grep -n --color"

# Alias wget to curl if not available
 
hash wget &> /dev/null
if [[ $? -eq 1 ]]; then
	alias wget="curl -L -O --retry 999 --retry-max-time 0 -C -"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
