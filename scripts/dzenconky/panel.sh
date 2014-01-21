#!/bin/sh

FG='#ffffff'
BG='#231f20'
#FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
FONT='PragmataPro-8'
# ~/Apps/dzenconky/conky.sh | dzen2 -e - -h '16' -ta l -fg $FG -bg $BG -fn $FONT
~/Apps/dzenconky/conky.sh | dzen2 -e 'onstart=hide;entertitle=unhide;leavetitle=hide;button1=hide' -h '17' -ta l -fg $FG -bg $BG -fn $FONT
