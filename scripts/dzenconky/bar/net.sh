#!/bin/bash

NET=$(iwconfig wlp3s0 | grep "Link Quality" | egrep -o "=[0-9]+" | egrep -o "[0-9]+")

if [ "$NET" == "" ]; then
  NET=0
fi

echo $((($NET * 100) / (70 * 3) ))
