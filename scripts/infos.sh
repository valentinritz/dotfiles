#!/bin/bash

if [ ! -z $DISPLAY ]; then
        WM_WINDOW=$(xprop -root _NET_SUPPORTING_WM_CHECK)
        WM_WINDOW=${WM_WINDOW##* }
        WM_NAME=$(xprop -id $WM_WINDOW 8s _NET_WM_NAME)
        WM_NAME=${WM_NAME##* }
        WM_NAME=`echo $WM_NAME | sed 's/\"//g'`
else
        WM_NAME=""
fi
CPU=$(cat /proc/cpuinfo | egrep "model name" -m 1 | sed -e 's/\(.*\)\t\:\s\(.*\)/\2/g')
RAM=$(cat /proc/meminfo | egrep "MemTotal" -m 1 | sed -e 's/.................//')
VIDEO=$(lspci | egrep "VGA compatible controller" -m 1 | sed -e 's/...................................//')
PACKAGES=$(pacman -Q | wc -l)
LASTSYNC=$(stat -c %y /var/lib/pacman/sync | sed -e 's/................$//')
VRAM=$(lspci -v -s `lspci | awk '/VGA/{print $1}'` | sed -n '/Memory.*, prefetchable/s/.*\[size=\([^]]\+\)\]/\1/p')
DATE=$(date)

endcolor='\e[0m'
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
pink='\e[1;35m'
aqua='\e[1;36m'
white='\e[1;37m'

clear

echo -e "${blue}$DATE${endcolor}"
echo ""
echo -e "${red}Kernel: \e[0m$(uname -r -m)"
echo -e "${red}User: \e[0m$USER@$(uname -n)"
echo -e "${yellow}Shell: \e[0m$SHELL"
echo -e "${yellow}Terminal: \e[0m$TERM"
if [ $WM_NAME ]; then
        echo -e "${green}Window Manager: \e[0m$WM_NAME"
fi
if [ $DESKTOP_SESSION ]; then
        echo -e "${green}Desktop Environment: \e[0m$DESKTOP_SESSION"
fi
echo -e "${aqua}CPU: \e[0m$CPU"
echo -e "${aqua}RAM: \e[0m$RAM"
echo -e "${blue}Video: \e[0m$VIDEO"
echo -e "${blue}VRAM: ${endcolor}$VRAM"
echo -e "${pink}Packages: ${endcolor}$PACKAGES"
echo -e "${pink}Last DB Sync: ${endcolor}$LASTSYNC"
echo ""
sudo df -h
# echo ""
# echo -e "${yellow}Custom Commands:${endcolor}"
# echo -e "${white}stats${endcolor}                       this prompt!"
# echo -e "${white}system-update${endcolor}               yaourt -Syu --aur                               ${red}requires root${endcolor}"
# echo -e "${white}ffmpeg-convert${endcolor}              converts all files in a folder to VBR Q2 MP3"
# echo -e ""
