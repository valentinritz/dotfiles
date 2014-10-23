#!/bin/sh

FG2='#ffffff'
FG='#777777'
BG='#111111'
FONT='DroidSansMono-16'
FONT2='DroidSansMono-8'

conky -c ~/Apps/dzen/desktopinfos/conkytime | dzen2 -h 40 -x 650 -y 480 -w 300 -ta l -bg $BG -fn $FONT2 -fg $FG | conky -c ~/Apps/dzen/desktopinfos/conkywifi | dzen2 -h 40 -x 650 -y 450 -w 300 -ta l -bg $BG -fn $FONT2 -fg $FG | conky -c ~/Apps/dzen/desktopinfos/conkybat | dzen2 -h 150 -x 650 -y 300 -w 150 -ta c -bg $BG -fn $FONT -fg $FG2 | conky -c ~/Apps/dzen/desktopinfos/conkyrc | dzen2 -h 150 -x 800 -y 300 -w 150 -ta c -bg $BG -fn $FONT -fg $FG2
