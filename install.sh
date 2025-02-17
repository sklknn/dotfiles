#!/bin/bash

echo "Welocome to my dots install script"

echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/pacman
%wheel ALL=(ALL) NOPASSWD: /usr/bin/yay" | sudo tee -a /etc/sudoers

cd ~ && mkdir git && cd git 
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si 

yay -Y --gendb 
yay -Syu --devel
yay -Y --devel --save 

cd ~ && git clone https://github.com/sklknn/dotfiles.git && cd dotfiles 

yay -S --noconfirm hyprland hypridle hyprcursor hyprsunset hyprpaper hyprlock hyprland-protocols hyprland-qt-support hyprland-qtutils hyprlang hyprpolkitagent hyprsysteminfo hyprutils xdg-desktop-portal-hyprland hyprwayland-scanner hyprpicker

yay -S --noconfirm kitty zsh

yay -S --noconfirm uwsm util-linux libnewt

yay -S --noconfirm swaync darkly

yay -S --noconfirm pipewire wireplumber 

yay -S --noconfirm qt5-wayland qt6-wayland

yay -S --noconfirm waybar 

systemctl --user enable --now waybar.service 

systemctl --user enable --now hyprpolkitagent.service 

yay -S --noconfirm wl-clipboard cliphist

yay -S --noconfirm nautilus neovim

yay -S --noconfirm nwg-look qt5ct qt6ct qt4ct gtk-engine-murrine sassc gnome-themes-extra

yay -S --noconfirm pavucontrol light 

yay -S --noconfirm spotify-launcher telegram-desktop vesktop 

yay -S --noconfirm stow 

stow --adopt .

yay -S --noconfirm fzf ttf-jetbrains-mono-nerd zoxide cava

chsh -s /bin/zsh

systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpolkitagent.service

yay -S --noconfirm sddm npm qt6-svg qt6-declarative qt5-quickcontrols2 qt5-svg qt5-graphicaleffects

sudo cp -r ~/dotfiles/unmanaged-by-stow/usr/share/sddm/themes/sugar-candy/ /usr/share/sddm/themes

sudo cp -f ~/dotfiles/unmanaged-by-stow/etc/sddm.conf /etc

sudo systemctl enable sddm.service

#systemctl enable greetd.service

yay -S --noconfirm archlinux-xdg-menu networkmanager network-manager-applet nm-connection-editor networkmanager-openvpn

sudo systemctl enable --now NetworkManager.service

yay -S --noconfirm cliphist hyprshot imv swayosd rofi-wayland

sudo systemctl enable --now swayosd-libinput-backend.service

sudo usermod -a -G video $USER

#GTK THEME
#sudo cp -r ~/.themes/Catppuccin-Dark /usr/share/themes
sudo cp -r ~/.themes/rose-pine-moon-gtk  /usr/share/themes
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/kitty

yay -S --noconfirm fastfetch unzip papirus-icon-theme udiskie rose-pine-hyprcursor rose-pine-cursor

#curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

#Folder icons 

cd ~/git && git clone https://github.com/vinceliuice/Colloid-icon-theme.git && cd Colloid-icon-theme

./install.sh -s catppuccin


