#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

/home/valentin/Apps/scripts/desktopfolder.sh &              #Firefox spawns always this fucking folder. rm FTW!
clipit &
urxvt -e ranger &
dunst &
mpd &
(sleep 1s && ~/Apps/scripts/cpgithub.sh) &                  #saves all config files to Github/dotfiles
(sleep 2s && /usr/bin/setxkbmap -option "ctrl:swapcaps") &  #switches CAPSLOCK and Ctrl
(sleep 2s && xcape) & 
(sleep 3s && urxvt -n newsbeuter -e newsbeuter) &           #option possible : --geometry=85x60+1060+27
(sleep 4s && firefox-nightly) &
(sleep 4s && thunderbird ) &
(sleep 7s && rm -d Desktop) &
(sleep 10s && /home/valentin/.dropbox-dist/dropboxd) &

# Things that I don't need anymore, but maybe...
# (sleep 4s && urxvt -geometry 166x65+27+27 -title earthquake -e earthquake) &
# compton & --blur-background-frame &

# sxhkd &
# exec bspwm
exec awesome
#exec startxfce4
