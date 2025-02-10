#!/bin/bash

echo "Welocome to my dots install script"

echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/pacman
%wheel ALL=(ALL) NOPASSWD: /usr/bin/yay" | sudo tee -a /etc/sudoers

cd ~ && mkdir git && cd git 
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si 

yay -Y --gendb 
yay -Syu --devel
yay -Y --devel --save 

cd ~/git && git clone https://github.com/sklknn/dotfiles.git && cd dotfiles 

yay -S --noconfirm hyprland-meta-git kitty zsh

yay -S --noconfirm uwsm util-linux libnewt

yay -S --noconfirm swaync 

yay -S --noconfirm pipewire wireplumber 

yay -S --noconfirm qt5-wayland qt6-wayland

yay -S --noconfirm waybar 

systemctl --user enable --now waybar.service 

systemctl --user enable --now hyprpolkitagent.service 

yay -S --noconfirm fuzzel wl-clipboard cliphist

yay -S --noconfirm nautilus neovim

yay -S --noconfitm nwg-look qt5ct qt6ct qt4ct gtk-engine-murrine sassc gnome-themes-extra

yay -S --noconfirm pavucontrol iwdgui light 

yay -S --noconfirm spotify-launcher telegram-desktop vesktop 

yay -S --noconfirm stow 

stow --adopt .

yay -S --noconfirm fzf ttf-jetbrains-mono-nerd zoxide

chsh -s /bin/zsh

sudo systemctl --user enable --now hyprpaper.service
sudo systemctl --user enable --now hypridle.service
sudo systemctl --user enable --now hyprpolkitagent.service

yay -S --noconfirm greetd greetd-regreet-git npm

systemctl enable greetd.service

yay -S --noconfirm archlinux-xdg-menu

yay -S --noconfirm cliphist udoskie hyprshot imv swayosd

sudo systemctl enable --now swayosd-libinput-backend.service

sudo usermod -a -G video $USER

sudo cp -rf dotfiles/unmanaged-by-stow/etc/greetd /etc/
sudo cp -r ~/.themes/Catppuccin-Dark /usr/share/themes
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/kitty

curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
