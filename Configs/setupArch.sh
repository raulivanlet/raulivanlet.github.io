#!/bin/bash


#--------------------Setting time for dualboot
sudo timedatectl set-local-rtc 1


#--------------------Installing all
echo "Updating..."
sudo pacman -Syu
echo "Downloading..."
sudo pacman -S os-prober ntfs-3g xorg-server mesa xf86-video-amdgpu nvidia nvidia-utils nvidia-prime i3-gaps i3blocks i3status dmenu lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings konsole dolphin chromium network-manager-applet nftables pulseaudio pulseaudio-alsa kmix lxappearance breeze breeze-gtk ttf-roboto noto-fonts-emoji notification-daemon dunst lm_sensors
#--------------------Installing grub--------------------os-prober ntfs-3g
#--------------------Installing Xorg--------------------xorg-server mesa
#--------------------Installing Drivers--------------------xf86-video-amdgpu nvidia nvidia-utils nvidia-prime
#--------------------Install I3--------------------i3-gaps i3blocks i3status dmenu
#--------------------Install Display Manager--------------------lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#--------------------Install Apps--------------------konsole dolphin chromium
#--------------------Network--------------------network-manager-applet nftables
#--------------------Music--------------------pulseaudio pulseaudio-alsa kmix
#--------------------KDE Apps Theme--------------------lxappearance breeze breeze-gtk ttf-roboto
#--------------------Emoji Support--------------------noto-fonts-emoji
#--------------------Notification Support--------------------notification-daemon dunst
#--------------------System Temperature--------------------lm_sensors


#--------------------Setting Grub
if [[ -f /etc/default/grub ]]
then
    sudo rm /etc/default/grub
	cp grub.txt grub
	sudo mv grub /etc/default
else
	cp grub.txt grub
	sudo mv grub /etc/default
fi
sudo grub-mkconfig -o /boot/grub/grub.cfg



#--------------------Setting bin folder and paths
if [[ ! -d ~/bin ]] ;then
    mkdir ~/bin
fi
if [[ ! -f ~/.profile ]] ;then
	sudo rm ~/.profile
	cp profile.txt .profile
	sudo mv .profile ~/	
fi



#--------------------Configure I3
if [[ -f ~/.config/i3/config ]]
then
	rm ~/.config/i3/config
	cp i3_config.txt config
	mv config ~/.config/i3/
else
	cp i3_config.txt config
	mv config ~/.config/i3/
fi



#--------------------Configure I3 Status
if [[ -f ~/.config/i3status/i3status.conf ]]
then
	rm ~/.config/i3status/i3status.conf
	cp i3_status_conf.txt i3status.conf
	mv i3status.conf ~/.config/i3status/
else
	cp i3_status_conf.txt i3status.conf
	mv i3status.conf ~/.config/i3status/
fi



#--------------------Pacman can install 32 bit programs
#if [[ -f /etc/pacman.conf ]] ;then
#	sudo rm /etc/pacman.conf
#fi
#sudo touch /etc/pacman.conf



echo "setting mouse completed"
#--------------------Disable Mouse Acceleration
#if [[ -f /etc/X11/xorg.conf.d/50-mouse-acceleration.conf ]] ;then
#	sudo rm /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
#fi
#sudo touch /etc/X11/xorg.conf.d/50-mouse-acceleration.conf



echo "setting dm completed"
#--------------------Install Display Manager
#systemctl enable lightdm.service
#printf "[Seat:*]
#greeter-session=lightdm-gtk-greeter"
#sudo vim /etc/lightdm/lightdm.conf