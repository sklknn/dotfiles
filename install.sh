#!/bin/bash

echo "Welocome to my dots install script"

echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/pacman
%wheel ALL=(ALL) NOPASSWD: /usr/bin/yay" | sudo tee -a /etc/sudoers

yay -S --noconfirm hyprland-meta-git kitty zsh

yay -S --noconfirm uwsm util-linux libnewt

yay -S --noconfirm swaync 

yay -S --noconfirm pipewire wireplumber 

yay -S --noconfirm qt5-wayland qt6-wayland

yay -S --noconfirm waybar 

systemctl --user enable --now waybar.service 

systemctl --user enable --now hyprpolkitagent.service 

yay -S --noconfirm fuzzel wl-clipboard cliphist

yay -S --noconfirm dolphin

yay -S --noconfitm nwg-look qt5ct qt6ct qt4ct

yay -S --noconfirm pavucontrol iwdgui light 

yay -S --noconfirm spotify-launcher telegram-desktop vesktop 

yay -S --noconfirm stow 

stow --adopt .

yay -S --noconfirm spicetify-cli 
