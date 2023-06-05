#!/bin/sh

window_title="dropdown_terminal"
#config_file="$HOME/.config/alacritty/alacritty_dropdown.yml"

if xwininfo -tree -root | grep "(\"$window_title\" " ;
then
	echo "dropdown_terminal detected" ;
	i3 ["instance=\"$window_title\"] scratchpad show; [instance=\"$window_title\"] move position center"
else
	echo "drowdown_terminal not detected... creating"
	i3 "exec --no-startup-id alacritty -t dropdown_terminal --class dropdown_terminal  -e $HOME/.scripts/tmuxdd.sh "
fi

