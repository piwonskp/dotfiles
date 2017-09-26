#!/bin/sh

$USERNAME = $1
$HOME = "/home/$USERNAME"

pacman -S - < pkglist.txt

pip install websocket-client
pip install requests

mkdir $HOME/.config/termite

ln -s $HOME/dotfiles/.Xresources $HOME/.Xresources
ln -s $HOME/dotfiles/.i3 $HOME/.i3
ln -s $HOME/dotfiles/.config/i3blocks $HOME/.config/i3blocks
ln -s $HOME/dotfiles/.config/termite $HOME/.config/termite
ln -s $HOME/dotfiles/.gtkrc-2.0 $HOME/.gtkrc-2.0
ln -s $HOME/dotfiles/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini

timedatectl set-timezone Europe/Warsaw
localectl set-locale LANG=pl_PL.utf8

