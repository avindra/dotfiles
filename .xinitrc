#!/bin/sh

# Apply desired screen layout
# this is managed via `arandr`.
#
# I manage this by creating a symlink from
# default.sh to the desired layout configuration.

# Apply colors via pywal
~/bin/setbg

# Remap capslock to backspace
setxkbmap -option caps:backspace

if [ -e ~/.screenlayout/default.sh ]; then
	~/.screenlayout/default.sh
fi


# MUST always be last
exec i3
