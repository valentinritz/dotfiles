#!/bin/sh

FG='#ffffff'
BG='#231f20'
FONT='PragmataPro-8'

conky -c ~/Apps/dzennotification/conkyrc | dzen2 -e 'button1=exit' -h '44' -x 1335 -y 21 -w 244 -ta l -bg $BG -fn $FONT
# (conky -c ~/Apps/dzennotification/conkyrc | dzen2 -e 'button1=exit' -h '36' -x 1342 -y 21 -w 237 -ta l -bg $BG -fn $FONT -title-name title &) && compton --opacity-rule '100:name="title"'
