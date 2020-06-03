#!/usr/bin/env bash

# Hack to allow root shells
# to go to main X session
# TODO: find safer way to do this
xhost +

# Disable monitor auto-shutoff
# TODO: maybe only do this when video
# apps are active
xset -dpms
xset s off


