#!/bin/sh

FG='#ffffff'
BG='#111111'
FONT='PragmataPro-8'

echo "hello" | dzen2 -e 'button1=exit' -h '44' -x 1330 -y 24 -w 244 -ta l -bg $BG -fn $FONT
# echo "hello" | dzen2 -h 20 -x 10 -y 20 -ta l -bg $BG -fn $FONT
