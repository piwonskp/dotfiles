#!/bin/sh

pacman -S - < pkglist.txt

pip install websocket-client
pip install requests

mkdir ~/.config/termite

ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.i3 ~/.i3
ln -s ~/dotfiles/.config/i3blocks ~/.config/i3blocks
ln -s ~/dotfiles/.config/termite ~/.config/termite

timedatectl set-timezone Europe/Warsaw
localectl set-locale LANG=pl_PL.utf8

