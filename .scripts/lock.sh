#! /bin/bash

grim  /tmp/lockscreen.png
convert -scale 10% -scale 1000% /tmp/lockscreen.png /tmp/lockscreen.png
swaylock -i /tmp/lockscreen.png
