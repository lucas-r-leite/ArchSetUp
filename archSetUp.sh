#!/bin/bash

# Read the list of Flatpak applications from flatpak_list.txt
while IFS= read -r line; do
	flatpak install flathub "$line"
done <flatpakList.txt

# Read the list of Arch Linux packages from arch_packages.txt
while IFS= read -r line; do
	sudo pacman -S --noconfirm "$line"
done <archPackages.txt

#Install yay
cd ~
sudo pacman -Syyu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

#Install yay packages
while IFS= read -r line; do
	sudo yay -S "$line"
done <yayPackages.txt
