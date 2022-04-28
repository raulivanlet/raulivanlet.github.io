#!/bin/bash

#--------------------Paths for files
GRUB_CONFIG=/etc/default/grub
PROFILE_CONFIG=~/.config/i3status/i3status.conf
I3_CONFIG=~/.config/i3/config
I3_STATUS_CONFIG=~/.config/i3status/i3status.conf
PACMAN_CONFIG=/etc/pacman.conf
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
MOUSE_ACCEL_CONFIG=/etc/X11/xorg.conf.d/50-mouse-acceleration.conf


GRUB_CONFIG=~/test_grub.txt
PROFILE_CONFIG=~/test_profile.txt
I3_CONFIG=~/test_i3.txt
I3_STATUS_CONFIG=~/test_i3_status.txt
PACMAN_CONFIG=~/test_pacman.conf
LIGHTDM_CONFIG=~/test_lightdm.txt
MOUSE_ACCEL_CONFIG=~/test_mouse_accel.txt

#--------------------Installing and setup grub
#yes | sudo pacman -S os-prober ntfs-3g
touch $GRUB_CONFIG
printf "#Grub Config File
GRUB_DEFAULT=saved
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=\"Arch\"
GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet\"
GRUB_CMDLINE_LINUX=""
GRUB_PRELOAD_MODULES=\"part_gpt part_msdos\"

GRUB_TIMEOUT_STYLE=menu
GRUB_TERMINAL_INPUT=console
GRUB_GFXMODE=1280x1024
GRUB_GFXPAYLOAD_LINUX=keep
GRUB_DISABLE_RECOVERY=true

GRUB_COLOR_NORMAL=\"light-green/black\"
GRUB_COLOR_HIGHLIGHT=\"yellow/dark-gray\"

#GRUB_BACKGROUND=\"/path/to/wallpaper\"
#GRUB_THEME=\"/path/to/gfxtheme\"

#GRUB_DISABLE_SUBMENU=y
GRUB_SAVEDEFAULT=true
GRUB_DISABLE_OS_PROBER=false" >> $GRUB_CONFIG
#sudo grub-mkconfig -o /boot/grub/grub.cfg


#--------------------Setting time for dualboot
#sudo timedatectl set-local-rtc 1



#--------------------Setting bin folder and paths
#mkdir ~/bin
printf "export PATH=$PATH:/home/user/bin
export QT_QPA_PLATFORMTHEME=qt5ct" >> $PROFILE


#--------------------Pacman can install 32 bit programs
printf "[multilib]
Include = /etc/pacman.d/mirrorlist" >> $PACMAN_CONFIG


#--------------------Installing Xorg 
#yes | sudo pacman -S xorg-server mesa


#--------------------Installing Drivers
#yes | sudo pacman -S xf86-video-amdgpu nvidia nvidia-utils nvidia-prime


#--------------------Install I3
#yes | sudo pacman -S i3-gaps i3blocks i3status dmenu


#--------------------Install Apps
#yes | sudo pacman -S konsole dolphin chromium


#--------------------Install Display Manager
#yes | sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#systemctl enable lightdm.service
printf "[Seat:*]
greeter-session=lightdm-gtk-greeter" >> $LIGHTDM_CONFIG


#--------------------Configure I3
printf "" >> $I3_CONFIG


#--------------------Configure I3 Status
printf "" >> $I3_STATUS_CONFIG


#--------------------Disable Mouse Acceleration
printf "Section "InputClass" 
	Identifier "My Mouse" 
	MatchIsPointer "yes" 
	Option "AccelerationProfile" "-1" 
	Option "AccelerationScheme" "none" 
	Option "AccelSpeed" "-1" 
EndSection" >> $MOUSE_ACCEL_CONFIG


#--------------------Network
#yes | sudo pacman -S network-manager-applet nftables


#--------------------Music
#yes | sudo pacman -S pulseaudio pulseaudio-alsa kmix


#--------------------KDE Apps Theme
#yes | sudo pacman -S lxappearance breeze breeze-gtk ttf-roboto


#--------------------Emoji Support
#yes | sudo pacman -S noto-fonts-emoji


#--------------------Notification Support
#yes | sudo pacman -S notification-daemon dunst


#--------------------System Temperature
#yes | sudo pacman -S lm_sensors