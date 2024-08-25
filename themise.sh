#!/bin/bash

echo "Check for update..."
sudo pacman -Syyu 2> /dev/null
sudo pacman -Syy lightdm lightdm-webkit2-greeter alacritty picom i3 i3status yay feh neofetch rofi vim bluez bluez-utils

echo "Creating config file..."
mkdir ~/.config/i3
mkdir ~/.config/i3status
mkdir ~/.config/alacritty
mkdir ~/.config/picom
mkdir ~/.config/rofi

echo "Clone git config files"
git clone https://github.com/glomidan/tools

echo "Copying config files to system"
cp -r .tools/config/i3/ ~/.config/
cp -r .tools/config/i3status/ ~/.config/
cp -r .tools/config/alacritty ~/.config/
cp -r .tools/config/picom/ ~/.config/
cp -r .tools/config/rofi ~/.config/

echo "Customing shell zith ZSH and 10klevel theme"
./tools/ZSH-Powerlevel10k.sh

echo "Cpoying RC files"
cp .tools/vimrc ~/.vimrc
cp .tools/zshrc ~/.zshrc

echo "Don't forget to adapt config files to user! OK?"
read

echo "Creating login screen theme"
yay -Syu lightdm-webkit2-theme-glorious
cd /tmp
git clone https://aur.archlinux.org/lightdm-webkit2-theme-glorious.git
cd lightdm-webkit2-theme-glorious
makepkg -sri

echo "edit lightdm.conf : change to 'greeter-session=lightdm-webkit2-greeter' and 'user-session to i3'"
sudo vim /etc/lightdm/lightdm.conf

echo "edit this file: Find 'webkit_theme' then set its value to 'glorious'."
# Find `debug_mode` then set it to true.
sudo vim /etc/lightdm/lightdm-webkit2-greeter.conf

while
do
    echo "Configuration finished, press Y(es) to reboot or N(o):"
    read rbt
    if [ rbt == "Y" -o rbt == "y" ]
    then
        echo "rebooting..."
        sleep 1
        sudo reboot now
    elif [ rbt == "N" -o  rbt == "n"]
    then
        echo "Ok, note that you have to reboot to apply changes"
        exit 0
    else
        echo "Bad entry !"
    fi
done
