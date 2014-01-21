#!/bin/bash

# low battery in %
LOW_BATTERY="10"
# display icon
ICON="/home/valentin/.config/awesome/icons/battery44.png"
# path to battery /sys
BATTERY_PATH="/sys/class/power_supply/BAT0/"

SLEEP="5000"

while [ true ]; do
    if [ -e "$BATTERY_PATH" ]; then
        BATTERY_ON=$(cat $BATTERY_PATH/status)

        if [ "$BATTERY_ON" == "Discharging" ]; then
            CURRENT_BATTERY=$(cat $BATTERY_PATH/capacity)

            if [ "$CURRENT_BATTERY" -lt "$LOW_BATTERY" ]; then
                notify-send -i "$ICON" -u critical  "La batterie est faible." "Plus que $CURRENT_BATTERY % : serre les fesses."
            fi
        fi
    fi
    sleep $SLEEP
done
