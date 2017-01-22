#!/bin/bash


newName=$(zenity --entry --text="What do you want to rename this window to?" --title="Rename window")

if [[ $? -ne 0 ]]; then
	exit 1
fi

xdotool set_window --name "${newName}" $(xdotool getwindowfocus)

