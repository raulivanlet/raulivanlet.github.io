#!/bin/bash


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
	sudo cp lightdm_config.txt /etc/lightdm/lightdm.conf
	systemctl enable lightdm.service
fi
if [[ -f /etc/lightdm/lightdm-gtk-greeter.conf ]] ;then
	sudo rm /etc/lightdm/lightdm-gtk-greeter.conf
	sudo cp lightdm_greeter_conf.txt /etc/lightdm/lightdm-gtk-greeter.conf
fi


#--------------------Install Virtual Machine
printf "\n\nSetting Virtual Machine..."
if [[ -f ~/br10.xml ]] ;then
	rm ~/br10.xml
	cp br10.xml ~/
	sudo virsh net-start br10
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