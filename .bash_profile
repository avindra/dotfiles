export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings
[[ -f ~/.homeenv ]] && . ~/.homeenv

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

uname=`uname -s`
if [[ "$uname" == "Linux" ]]; then
	alias pbcopy="xclip -selection c"
	# Save history immediately
	shopt -s histappend
	PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

	export PS1='\w$(__git_ps1) ⟩ '
elif [[ "$uname" == "Darwin" ]]; then
	# ZSH-era macos decides to
	# annoy Bash users. This removes that noise.
	export BASH_SILENCE_DEPRECATION_WARNING=1

	# Local python bin
	export PATH="~/Library/Python/2.7/bin:$PATH"

	# fix broken crontab editing on macos
	alias crontab="VIM_CRONTAB=true crontab"

	PS1=' $(__git_ps1) \w ⟩ '

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

    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
        source ~/.gnupg/.gpg-agent-info
        export GPG_AGENT_INFO
    else
        eval $(gpg-agent --daemon)
    fi

 	source /usr/local/etc/bash_completion

	# Prefer GNU feature set to BSD ones
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

	# Prefer brew python over system python
	export PATH="/usr/local/opt/python/libexec/bin:$PATH"

	alias ldd='otool -L'

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

	export PATH="$PATH:${HOME}/bin"
	alias l="ls -alF"
	alias update="brew update && brew upgrade && brew cu"
elif [[ "$uname" == "Msys" ]]; then
	cd ~/Dev 2> /dev/null
	alias l='ls -alF'
fi

# Mainly for docker for {mac,windows} hacks
if [[ "$uname" != "Linux" ]]; then
	# SSH into the xhyve / hyper-v vm
	# https://forums.docker.com/t/is-it-possible-to-ssh-to-the-xhyve-machine/17426/5
	function d4exec() {
		extraFlags=""
		if [[ "$1" == "tty" ]]; then
			extraFlags="-t"
			shift
		fi
		docker run --rm  -i ${extraFlags} --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh "$@"
	}
	function d4ssh() {
		d4exec tty "$@"
	}
	export -f d4exec
	export -f d4ssh
fi

alias grep="grep -n --color"

# Alias wget to curl if not available

hash wget &> /dev/null
if [[ $? -eq 1 ]]; then
	alias wget="curl -L -O --retry 999 --retry-max-time 0 -C -"
fi

## "bash-sensible" options
shopt -s autocd 2> /dev/null
PROMPT_DIRTRIM=4

# Disable Software Flow Control (C-s C-q)
# https://unix.stackexchange.com/a/72092/63602
stty -ixon


