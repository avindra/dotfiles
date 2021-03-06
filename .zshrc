# shellcheck shell=sh

# I am not a ZSH user.
# MacOS uses this shell by default,
# so this file concerns only Apple.

unalias dir &>/dev/null
. ~/.settings

eval "$(starship init zsh)"

# Random cruft that might serve use later
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/dsa_id"
