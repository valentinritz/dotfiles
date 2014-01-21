#!/bin/bash

# cp all the files config files to the github directory

# save scripts to dotfiles/scripts
cp ~/Apps/space.sh ~/Apps/inkddg.sh ~/Apps/battery.sh ~/Apps/infos.sh ~/Apps/wifi.sh ~/Apps/cpgithub.sh -r ~/Apps/dzenconky ~/Apps/dzennotification -t ~/Documents/Github/dotfiles/scripts

# save awesomewm config files to dotfiles/awesome
cp -r ~/.config/awesome -t ~/Documents/Github/dotfiles/awesome

# save gtk theme and icons to dotfiles/theme
cp -r ~/.themes/Phosbird -t ~/Documents/Github/dotfiles/theme

# save config files to dotfiles/config
cp ~/.vimrc ~/.gvimrc ~/.zshrc ~/.gmrunrc ~/.Xdefaults -t ~/Documents/Github/dotfiles/config
cp ~/.snownews/urls ~/.snownews/colors ~/.snownews/browser -t ~/Documents/Github/dotfiles/config/.snownews
cp ~/.ncmpcpp/config -t ~/Documents/Github/dotfiles/config/.ncmpcpp
cp ~/.mpd/mpd.conf -t ~/Documents/Github/dotfiles/config/.mpd
cp ~/.irssi/config ~/.irssi/thing.theme -t ~/Documents/Github/dotfiles/config/.config/irssi
cp -r ~/.fonts/PragmataPro -t ~/Documents/Github/dotfiles/config/.fonts
cp ~/.config/clipit/clipitrc -t ~/Documents/Github/dotfiles/config/.config/clipit
cp ~/.config/zathura/zathurarc -t ~/Documents/Github/dotfiles/config/.config/zathura
cp -r ~/.config/ranger -t ~/Documents/Github/dotfiles/config/.config
sudo cp -r ~/.vim -t ~/Documents/Github/dotfiles/config/
cp ~/.config/Thunar/uca.xml -t ~/Documents/Github/dotfiles/config/.config/Thunar

# save firefox related files to dotfiles/userstyle
cp -r ~/Apps/newweathertab/ -t ~/Documents/Github/dotfiles/userstyles
