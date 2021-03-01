#! /bin/bash

scrot -o /tmp/lockscreen.png
convert -scale 10% -scale 1000% /tmp/lockscreen.png /tmp/lockscreen.png
i3lock -i /tmp/lockscreen.png
