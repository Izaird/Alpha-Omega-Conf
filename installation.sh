#!/bin/bash

# INSTALL SCRIPT FOR MANJARO	
# Installing some basic system utilities first.

cd ~

echo "Installation with pacman"
sudo pacman -Syu
sudo pacman -S yay ranger telegram-desktop python-pip chromium \
               code zsh --noconfirm

echo "Installation with yay"
yay -S snapd  --noconfirm

echo "Installation with snapd"
sudo systemctl enable --now snapd.socket
sudo snap install spotify

echo "Installation with pip"
sudo pip install powerline-shell

echo "Creation of directorys"
mkdir Code
mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json

echo "Moving config files"
sudo cp Alpha-Omega-Conf/config-files/.gitconfig ~/.gitconfig
sudo cp Alpha-Omega-Conf/config-files/.bashrc ~/.bashrc
sudo cp Alpha-Omega-Conf/config-files/powerline.json ~/.config/powerline-shell/config.json
sudo cp Alpha-Omega-Conf/config-files/xorg.conf /etc/X11/xorg.conf

#change of terminal
zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
