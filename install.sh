#!/bin/sh

echo 'Update packages'
sudo pacman -Syu && yay -Su

echo 'Install requirements'
sudo pacman -Syy zsh picom alacritty rofi i3-wm i3status i3blocks firefox curl ttf-font-awesome git

echo 'Install dotfiles'
cp ./zshrc ~/.config/.zshrc
cp ./vimrc ~/.config/.vimrc
cp -R ./config/rofi ~/.config/rofi
cp -R ./config/alacritty ~/.config/alacritty
cp -R ./config/i3/ ~/.config/i3
cp -R ./config/i3status/ ~/.config/i3status

echo 'Install zSH Theme'
./ZSH-Powerlevel10k.sh
