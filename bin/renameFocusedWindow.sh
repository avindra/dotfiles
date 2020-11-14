#!/usr/bin/fish

set oldName (xdotool getactivewindow getwindowname)
set newName (zenity --entry --text="New name for  [ $oldName ]?" --title="Rename window")

if test $status -ne 0
	exit 1
end

xdotool set_window --name $newName (xdotool getwindowfocus)
