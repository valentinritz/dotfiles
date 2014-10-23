#!/bin/sh

FG2='#cccccc'
BG='#111111'
FONT='ClearSansThin-16'

conky -c ~/Apps/dzen/desktopchange/conkydesktop | dzen2 -e "button1=exit" -h 50 -x 10 -y 10 -w 50 -ta c -bg $BG -fn $FONT -fg $FG2
