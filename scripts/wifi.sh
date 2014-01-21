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
    notify-send -i "$ICON" "$NET_CURRENT : Connection établie" "Go go PORN!"
    break
  fi

  # if [ -d "$DIRECTORY" ]; then
  # fi
# echo `sudo netctl-auto current | grep 'Aucun' | awk '{print $2}'`
  # echo "$NET_CURRENT"

    # if ["$NET_CURRENT" == \"find: "/run/network": Aucun fichier ou dossier de ce type\" ]; then
    #   notify-send -i "$ICON" "$NET_CURRENT : Connection etablie" "Go go PORN!"
    #   break
    # fi
    # if [ -e "$BATTERY_PATH" ]; then
    #     BATTERY_ON=$(cat $BATTERY_PATH/status)

    #     if [ "$BATTERY_ON" == "Discharging" ]; then
    #         CURRENT_BATTERY=$(cat $BATTERY_PATH/capacity)

    #         if [ "$CURRENT_BATTERY" -lt "$LOW_BATTERY" ]; then
    #             notify-send -i "$ICON" -u critical  "La batterie est faible." "Plus que $CURRENT_BATTERY % : serre les fesses."
    #         fi
    #     fi
    # fi
done
