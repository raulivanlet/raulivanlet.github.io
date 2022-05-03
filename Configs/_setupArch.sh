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

#--------------------Network-----------------------------------------nftables network-manager-applet
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


#--------------------Time--------------------------------------------ntp
#--------------------Managing Application Extensions-----------------xdg-utils kde-cli-tools   <-----handlr - if it doesn't work
#--------------------Other Xorg / Nvidia Settings--------------------nvidia-settings
#--------------------System Temperature------------------------------lm_sensors


#--------------------Setting Grub
printf "\n\nSetting Up Grub..."
if [[ -f /etc/default/grub ]] ;then
    sudo rm /etc/default/grub
fi
sudo cp grub.txt /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg


#--------------------Configure I3
printf "\n\nSetting Up I3..."
if [[ -f ~/.config/i3/config ]] ;then
	rm ~/.config/i3/config
fi
cp i3_config.txt ~/.config/i3/config


#--------------------Configure I3 Status
printf "\n\nSetting Up I3 Bar..."
if [[ -f ~/.config/i3status/i3status.conf ]] ;then
	rm ~/.config/i3status/i3status.conf
fi
cp i3_status_conf.txt ~/.config/i3status/i3status.conf


#--------------------Pacman can install 32 bit programs
printf "\n\nSetting Up Pacman..."
if [[ -f /etc/pacman.conf ]] ;then
	sudo rm /etc/pacman.conf
fi
sudo cp pacman_conf.txt /etc/pacman.conf


#--------------------Setting bin folder and paths
printf "\n\nSetting Up Bin & .profile..."
if [[ ! -d ~/bin ]] ;then
    mkdir ~/bin
fi
if [[ ! -f ~/.profile ]] ;then
	cp profile.txt ~/.profile
fi


#--------------------Disable Mouse Acceleration
printf "\n\nSetting Mouse Acceleration..."
if [[ -f /etc/X11/xorg.conf.d/50-mouse-acceleration.conf ]] ;then
	sudo rm /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
fi
sudo cp x_mouse_accel.txt /etc/X11/xorg.conf.d/50-mouse-acceleration.conf


#--------------------Setting HDPI Monitor
printf "\n\nSetting HDPI Monitor..."
if [[ -f ~/.Xresources ]] ;then
	rm ~/.Xresources
fi
cp x_resources.txt ~/.Xresources


#--------------------Install Display Manager
printf "\n\nSetting Display Manager..."
if [[ -f /etc/lightdm/lightdm.conf ]] ;then
	sudo rm /etc/lightdm/lightdm.conf
	sudo cp v_lightdm_config.txt /etc/lightdm/lightdm.conf
	systemctl enable lightdm.service
fi
if [[ -f /etc/lightdm/lightdm-gtk-greeter.conf ]] ;then
	sudo rm /etc/lightdm/lightdm-gtk-greeter.conf
	sudo cp lightdm_greeter_conf.txt /etc/lightdm/lightdm-gtk-greeter.conf
fi


#--------------------Install Virtual Machine
printf "\n\nSetting Display Manager..."
if [[ ! -f ~/br10.xml ]] ;then
	#rm ~/br10.xml
	cp br10.xml ~/
	sudo systemctl enable libvirtd.service
	sudo systemctl start libvirtd.service
	sudo usermod -a -G libvirt $(whoami)
	newgrp libvirt
	#sudo virsh net-start br10
	#--------------------Setting time for dualboot
	#sudo timedatectl set-local-rtc 1
fi


:'
#--------------------Setting Xorg
printf "\n\nSetting Xorg..."
if [[ -f /etc/X11/xorg.conf ]] ;then
    sudo rm /etc/X11/xorg.conf
	sudo cp xorg_config.txt /etc/X11/xorg.conf
	# nvidia-xconfig
	#X -configure
fi
'


#THE END
printf "\n"