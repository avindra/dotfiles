export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings
. ~/.homeenv

export GPG_TTY=`tty`

# dedupe bash history
export HISTCONTROL=ignoreboth:erasedups

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

# Platform-specific configurations.
# 1) Linux
# 2) macOS / iOS (aka. Apple)
# 2) cygwin / Windows

uname=`uname`
if [[ $HOSTNAME == "dolores" ]]; then
	. ~/.work_profile
	export TERMINAL="urxvtc"
	export TMPDIR="/mnt/4tb/Scratch/tmp"
fi


if [[ "$uname" == "Linux" ]]; then
	alias pbcopy="xclip -selection c"
	# Save history immediately
	shopt -s histappend
	PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

	export PS1='\w $(__git_ps1) > '
elif [[ "$uname" == "Darwin" ]]; then

	# Local python bin
	export PATH="~/Library/Python/2.7/bin:$PATH"

	# fix broken crontab editing on macos
	alias crontab="VIM_CRONTAB=true crontab"

	PS1=' \w $(__git_ps1) > '

	# Disable annoying tilde expansion
	_expand() { :; }
	export -f _expand

	# Only needed for mac-specific "ls"
	# The coreutils version will work with the alias
	# instead.
	export LSCOLORS="ExFxCxDxBxegedabagacad"
	export CLICOLOR=1

	alias ls="_ls"
	alias ll="ls -l"
	_ls ()
	{
	    local IFS=' ';
	    command ls $LS_OPTIONS ${1+"$@"}
	}
	export -f _ls

	# show diff ps1 if sshing in from home
	if [[ -n "$SSH_CLIENT" ]]; then
		connectingClient=`echo "$SSH_CLIENT" | perl -pe 's/ .+/ /g' 2> /dev/null | tr -d '[:space:]'`
		if [[ "$connectingClient" == "${HOME_IP}" ]]; then
			PS1='osx:\w $(__git_ps1) \$ '
		fi
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

	# fix BSD nonsense
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

	# Prefer brew python over system python
	export PATH="/usr/local/opt/python/libexec/bin:$PATH"


	# Java pls
	export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"
	export JDK_HOME="$JAVA_HOME"

	alias ldd='otool -L'

	NODEBIN=$(dirname $(readlink -f `which node`))
	export PATH="$NODEBIN:$PATH"
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

alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /home/avindra/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash ] && . /home/avindra/.config/yarn/global/node_modules/tabtab/.completions/yarn.bash


## "bash-sensible" options
shopt -s autocd 2> /dev/null
PROMPT_DIRTRIM=4

# Disable Software Flow Control (C-s C-q)
# https://unix.stackexchange.com/a/72092/63602
stty -ixon

eval "$(direnv hook bash)"
