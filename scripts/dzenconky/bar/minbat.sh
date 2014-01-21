#!/bin/bash

BAT=$(acpi | cut -d ',' -f 2 | egrep -o '[0-9]+')

echo $((( 100 - $BAT) / 3 ))
