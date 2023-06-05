#!/bin/sh

window_title="dropdown_terminal"
config_file="$HOME/.config/alacritty/alacritty_dropdown.yml"

#if xwininfo -tree -root | grep "(\"$window_title\" " ;
if true ;
then
	echo "dropdown_terminal detected" ;
	sway ["instance=\"$window_title\"] scratchpad show; [instance=\"$window_title\"] move position center"
else
	echo "drowdown_terminal not detected... creating"
	sway "exec --no-startup-id alacritty -t dropdown_terminal --class dropdown_terminal --config-file $config_file -e $HOME/.scripts/tmuxdd.sh "
fi

