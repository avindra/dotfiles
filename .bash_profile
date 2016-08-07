export LS_OPTIONS="$LS_OPTIONS --color=always"

. ~/.settings

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


# TODO: move these into a place where they actually
# get executed on login.

# Hack to allow root
# TODO: find safer way to do this 
xhost +

# Disable monitor auto-shutoff
# TODO: maybe only do this when video
# apps are active
xset -dpms
xset s off


# Alias wget to curl if not available
 
hash wget &> /dev/null
if [[ $? -eq 1 ]]; then
	alias wget="curl -O --retry 999 --retry-max-time 0 -C -"
fi
