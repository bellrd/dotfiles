#!/bin/sh

if swaymsg -t get_tree | grep -iE "dropdown_terminator";
then
	echo "dropdown_terminator not  detected";
	sway '[title=dropdown_terminator] scratchpad show; move position center';
else
	echo "dropdown_terminator not detected... creating";
	sway 'exec --no-startup-id terminator -T dropdown_terminator -g $HOME/.config/terminator/config_dropdown -e $HOME/.scripts/tmuxdd.sh'
fi
