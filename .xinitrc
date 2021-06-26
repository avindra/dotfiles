#!/usr/bin/sh

# Source common scripts (per suse)
. /etc/X11/xinit/xinitrc.common

# Apply desired screen layout
# this is managed via `arandr`.
#
# I manage this by creating a symlink from
# default.sh to the desired layout configuration.

# Remap capslock to backspace
setxkbmap -option caps:backspace

# Restore desired screen layout
if [ -e ~/.screenlayout/default.sh ]; then
	~/.screenlayout/default.sh
fi

# Apply colors via pywal
~/bin/setbg

# scale qt5+ apps
export QT_SCALE_FACTOR=2.2

# rxvt-unicode daemon startup
# urxvtd -q -o -f

# start preferred wm
#exec xmonad
#exec spectrwm
exec i3

