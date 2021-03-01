xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Escape"
xmodmap -e "keycode 0 = Caps_Lock"
picom&
i3
