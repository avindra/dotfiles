export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings
. ~/.homeenv

export GPG_TTY=`tty`

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

if [[ $HOSTNAME == "avin-linux" ]]; then
	. ~/.work_profile
	export TERMINAL="xfce4-terminal"

	# Save history immediately
	shopt -s histappend
	PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

	export PS1='\w $(__git_ps1) > '
fi

# Platform-specific configurations.
# 1) OS X / iOS (Apple)
# 2) cygwin / Windows


uname=`uname`
if [[ "$uname" == "Darwin" ]]; then
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	# Local python bin
	export PATH="~/Library/Python/2.7/bin/:$PATH"

	# fix broken crontab editing on macos
	alias crontab="VIM_CRONTAB=true crontab"

	export PS1=' \w $(__git_ps1) > '

	# show diff ps1 if sshing in from home
	connectingClient=`echo "$SSH_CLIENT" | perl -pe 's/ .+/ /g' 2> /dev/null | tr -d '[:space:]'`
	if [[ "$connectingClient" == "${HOME_IP}" ]]; then
		PS1='osx:\w $(__git_ps1) \$ '
	fi

	function chromeless() {
		open -n -a 'Google Chrome' --args "--app=$1"
	}

    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
        source ~/.gnupg/.gpg-agent-info
        export GPG_AGENT_INFO
    else
        eval $(gpg-agent --daemon)
    fi

	source /usr/local/etc/bash_completion
	source /usr/local/etc/bash_completion.d/git-prompt.sh

	alias ldd='otool -L'

	export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"

	# Yarn global bin
	export PATH="$PATH:`yarn global bin 2> /dev/null`"

    # SSH into the xhyve vm
    # https://forums.docker.com/t/is-it-possible-to-ssh-to-the-xhyve-machine/17426/5
    function d4mexec() {
        extraFlags=""
        if [[ "$1" == "tty" ]]; then
            extraFlags="-t"
            shift
        fi
        docker run --rm  -i ${extraFlags} --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh "$@"
    }
    function d4mssh() {
        d4mexec tty "$@"
    }
    export -f d4mexec
    export -f d4mssh

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
	alias update="brew update && brew upgrade && brew cu && apm update -c false"
elif [[ "$uname" == "MINGW64_NT-6.1" ]]; then
	cd ~/Dev 2> /dev/null
	alias l='ls -alF'
elif [[ "$uname" == "Linux" ]]; then
    alias pbcopy="xclip -selection c"
fi

alias grep="grep -n --color"

# Alias wget to curl if not available

hash wget &> /dev/null
if [[ $? -eq 1 ]]; then
	alias wget="curl -L -O --retry 999 --retry-max-time 0 -C -"
fi

alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /home/avindra/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash ] && . /home/avindra/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash
