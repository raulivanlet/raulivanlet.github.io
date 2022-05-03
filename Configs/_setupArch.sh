#!/bin/bash



#--------------------Installing all
printf "\n\nUpdating..."
sudo pacman -Syu


printf "\n\nDownloading..."
sudo pacman -S os-prober ntfs-3g xorg-server mesa xf86-video-amdgpu i3-gaps i3blocks i3status dmenu lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings alacritty thunar chromium 
sudo pacman -S nftables network-manager-applet pulseaudio pulseaudio-alsa
sudo pacman -S notification-daemon dunst gnome-keyring libsecret seahorse
#--------------------Installing grub--------------------os-prober ntfs-3g
#--------------------Installing Xorg--------------------xorg-server xorg-xrandr mesa
#--------------------Installing Drivers--------------------xf86-video-amdgpu nvidia nvidia-utils nvidia-prime
#--------------------Install I3--------------------i3-gaps i3blocks i3status dmenu
#--------------------Install Display Manager--------------------lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#--------------------Install Apps-------------------- alacritty thunar chromium git
#--------------------Network--------------------nftables network-manager-applet
#--------------------Time--------------------ntp
#--------------------Music--------------------pulseaudio pulseaudio-alsa kmix
#--------------------KDE Apps Theme--------------------lxappearance breeze breeze-gtk noto-fonts-emoji
#--------------------Notification Support--------------------notification-daemon dunst
#--------------------Keyring--------------------gnome-keyring libsecret seahorse
#--------------------System Temperature--------------------lm_sensors
#--------------------Managing Application Extensions--------------------xdg-utils kde-cli-tools   <-----handlr - if it doesn't work
#--------------------Other Xorg / Nvidia Settings--------------------nvidia-settings



#--------------------Setting time for dualboot
sudo timedatectl set-local-rtc 1



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



:'
#--------------------Setting Xorg
printf "\n\nSetting Xorg..."
if [[ -f /etc/X11/xorg.conf ]] ;then
    sudo rm /etc/X11/xorg.conf
fi
sudo cp xorg_config.txt /etc/X11/xorg.conf
# nvidia-xconfig
#X -configure
'



#--------------------Install Display Manager
printf "\n\nSetting Display Manager..."
if [[ -f /etc/lightdm/lightdm.conf ]] ;then	
	sudo cp v_lightdm_config.txt /etc/lightdm/lightdm.conf
fi
: '
systemctl enable lightdm.service
if [[ -f /etc/lightdm/lightdm-gtk-greeter.conf ]] ;then
	sudo rm /etc/lightdm/lightdm-gtk-greeter.conf
	sudo cp lightdm_greeter_conf.txt /etc/lightdm/lightdm-gtk-greeter.conf
fi
'



#--------------------Install Virtual Machine
printf "\n\nSetting Display Manager..."
if [[ -f ~/br10.xml ]] ;then
	rm ~/br10.xml	
fi
cp br10.xml ~/



#THE END
printf "\n"