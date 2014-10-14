#!/bin/bash

# low battery in %
LOW_BATTERY="10"
# display icon
ICON="/home/valentin/.config/awesome/icons/net44.png"
# path to battery /sys
# NET_CURRENT= sudo netctl-auto current

SLEEP="1"

while [ true ]; do

  DIRECTORY="/run/network"
  if [ ! -d "$DIRECTORY" ]; then
    sleep $SLEEP
  else
    NET_CURRENT=`sudo netctl-auto current`
    sleep 1
      # notify-send -i "$ICON" "$NET_CURRENT : Connection établie" "Go go PORN!"
      notify-send "$NET_CURRENT : Connection établie" "Go go PORN!"
    break
  fi
done
