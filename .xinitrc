#!/usr/bin/sh

# Source common scripts (per suse)
. /etc/X11/xinit/xinitrc.common

# Make capslock another Windows key
setxkbmap -option caps:super

# Restore desired screen layout
if [ -e ~/.screenlayout/default.sh ]; then
	~/.screenlayout/default.sh
fi

# do startup routine
~/bin/startup

# scale qt5+ apps
export QT_SCALE_FACTOR=2.2

# rxvt-unicode daemon startup
# urxvtd -q -o -f

# wms: xmonad spectrwm
exec i3

