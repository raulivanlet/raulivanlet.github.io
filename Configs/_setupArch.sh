#!/bin/bash


#--------------------Installing all
printf "\n\nUpdating..."
yes | sudo pacman -Syu


printf "\n\nDownloading..."
#--------------------Installing grub---------------------------------os-prober ntfs-3g
yes | sudo pacman -S os-prober ntfs-3g

#--------------------Installing Xorg---------------------------------xorg-server xorg-xrandr mesa
yes | sudo pacman -S xorg-server xorg-xrandr mesa

#--------------------Installing Drivers------------------------------xf86-video-amdgpu nvidia
yes | sudo pacman -S xf86-video-amdgpu nvidia

#--------------------Install I3--------------------------------------i3-gaps i3blocks i3status dmenu
yes | sudo pacman -S i3-gaps i3blocks i3status dmenu

#--------------------Install Display Manager-------------------------lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
yes | sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

#--------------------Install Apps------------------------------------konsole dolphin chromium git
yes | sudo pacman -S konsole dolphin chromium git

#--------------------Network-----------------------------------------nftables network-manager-applet ntp
yes | sudo pacman -S nftables network-manager-applet ntp

#--------------------Music-------------------------------------------pulseaudio pulseaudio-alsa kmix
yes | sudo pacman -S pulseaudio pulseaudio-alsa kmix

#--------------------KDE Apps Theme----------------------------------lxappearance ttf-fira-mono noto-fonts-emoji breeze breeze-gtk
yes | sudo pacman -S lxappearance ttf-fira-mono noto-fonts-emoji breeze breeze-gtk

#--------------------Notification Support----------------------------notification-daemon dunst
yes | sudo pacman -S notification-daemon dunst

#--------------------Keyring-----------------------------------------gnome-keyring libsecret seahorse
yes | sudo pacman -S gnome-keyring libsecret seahorse

#--------------------Virtual Manager----------------------------------virt-manager libvirt qemu qemu-arch-extra dnsmasq dmidecode bridge-utils ovmf vde2 openbsd-netcat
yes | sudo pacman -S virt-manager libvirt qemu qemu-arch-extra dnsmasq dmidecode bridge-utils ovmf vde2 openbsd-netcat


#--------------------Managing Application Extensions-----------------xdg-utils kde-cli-tools   <-----handlr - if it doesn't work
#--------------------Other Xorg / Nvidia Settings--------------------nvidia-settings
#--------------------System Temperature------------------------------lm_sensors


./setupArchConfigs.sh


#--------------------Install Virtual Machine
printf "\n\nSetting Virtual Machine..."
systemctl enable ntpd.service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
#sudo virsh net-start br10
#--------------------Setting time for dualboot
#sudo timedatectl set-local-rtc 1


#THE END
printf "\n"