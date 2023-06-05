#!/bin/sh

# This is bound to Shift+PrintScreen by default, requires grim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. 

mkdir -p $HOME/Pictures/screenshots
mkdir -p $HOME/vids/recording
SDIR=$HOME/Pictures/screenshots
VDIR=$HOME/vids/recording

case "$(printf "a selected area\\nfull screen\\na selected area (copy)\\nfull screen (copy)\\nrecord full screen\\nrecord selected area\\nstop recording" | dmenu -l 7 -i -p "Screenshot which area?")" in
	"a selected area") grim -g "$(slurp)" $SDIR/grim-selected-"$(date '+%y%m%d-%H%M-%S').png" ;;
	# "current window") maim -i "$(xdotool getactivewindow)" $SDIR/grim-window-"$(date '+%y%m%d-%H%M-%S').png" ;;
	"full screen") grim $SDIR/grim-full-"$(date '+%y%m%d-%H%M-%S').png" ;;
	"a selected area (copy)") grim -g "$(slurp)" - | wl-copy ;;
	# "current window (copy)") maim -i "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png ;;
	"full screen (copy)") grim - | wl-copy ;;
	"record full screen") wf-recorder -f $VDIR/record-full-"$(date '+%y%m%d-%H%M-%S').mp4" ;;
	"record selected area") wf-recorder -g "$(slurp)" -f $VDIR/record-"$(date '+%y%m%d-%H%M-%S').mp4" ;;
	"stop recording") pkill --signal=INT wf-recorder ;;
esac
