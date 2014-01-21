#!/bin/bash

VOL=$(amixer get Master | egrep -o '[0-9]+%'| egrep -o '[0-9]+')

echo $(((100 - $VOL) * 2))
