#!/bin/bash



#--------------------Setting time for dualboot
sudo timedatectl set-local-rtc 1



#--------------------Installing all
echo ""
echo ""
echo "Updating..."
sudo pacman -Syu



echo ""
echo ""
echo "Downloading..."
sudo pacman -S os-prober ntfs-3g xorg-server xorg-xrandr mesa xf86-video-amdgpu nvidia nvidia-utils nvidia-prime i3-gaps i3blocks i3status dmenu lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo pacman -S konsole dolphin network-manager-applet nftables pulseaudio pulseaudio-alsa kmix lxappearance breeze breeze-gtk ttf-roboto noto-fonts-emoji notification-daemon dunst 
sudo pacman -S gnome-keyring libsecret seahorse lm_sensors xdg-utils kde-cli-tools nvidia-settings
#--------------------Installing grub--------------------os-prober ntfs-3g
#--------------------Installing Xorg--------------------xorg-server xorg-xrandr mesa
#--------------------Installing Drivers--------------------xf86-video-amdgpu nvidia nvidia-utils nvidia-prime
#--------------------Install I3--------------------i3-gaps i3blocks i3status dmenu
#--------------------Install Display Manager--------------------lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#--------------------Install Apps--------------------konsole dolphin
#--------------------Network--------------------network-manager-applet nftables
#--------------------Music--------------------pulseaudio pulseaudio-alsa kmix
#--------------------KDE Apps Theme--------------------lxappearance breeze breeze-gtk ttf-roboto
#--------------------Emoji Support--------------------noto-fonts-emoji
#--------------------Notification Support--------------------notification-daemon dunst
#--------------------Keyring--------------------gnome-keyring libsecret seahorse
#--------------------System Temperature--------------------lm_sensors
#--------------------Managing Application Extensions--------------------xdg-utils kde-cli-tools   <-----handlr - if it doesn't work
#--------------------Other Xorg / Nvidia Settings--------------------nvidia-settings
#purpose (optional) - share context menu
#extra-cmake-modules (make)
#kdoctools (make)








echo ""
echo ""
echo "Setting Up Grub..."
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



echo ""
echo ""
echo "Setting Up Bin & .profile..."
#--------------------Setting bin folder and paths
if [[ ! -d ~/bin ]] ;then
    mkdir ~/bin
fi
if [[ ! -f ~/.profile ]] ;then
	sudo rm ~/.profile
	cp profile.txt .profile
	sudo mv .profile ~/	
fi



echo ""
echo ""
echo "Setting Up I3..."
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



echo ""
echo ""
echo "Setting Up I3 Bar..."
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



echo ""
echo ""
echo "Setting Up Pacman..."
#--------------------Pacman can install 32 bit programs
if [[ -f /etc/pacman.conf ]]
then
	sudo rm /etc/pacman.conf
	cp pacman_conf.txt pacman.conf
	sudo mv pacman.conf /etc/
else
	cp pacman_conf.txt pacman.conf
	sudo mv pacman.conf /etc/
fi



echo ""
echo ""
echo "Setting Mouse Acceleration..."
#--------------------Disable Mouse Acceleration
if [[ -f /etc/X11/xorg.conf.d/50-mouse-acceleration.conf ]]
then
	sudo rm /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
	cp mouse_acel_conf.txt 50-mouse-acceleration.conf
	sudo mv 50-mouse-acceleration.conf /etc/X11/xorg.conf.d/
else
	cp mouse_acel_conf.txt 50-mouse-acceleration.conf
	sudo mv 50-mouse-acceleration.conf /etc/X11/xorg.conf.d/
fi



echo ""
echo ""
echo "Setting HDPI Monitor..."
#--------------------Setting HDPI Monitor
if [[ -f ~/.Xresources ]]
then
	sudo rm ~/.Xresources
	cp x_resources.txt ~/.Xresources
	mv ~/.Xresources ~/
else
	cp x_resources.txt ~/.Xresources
	mv ~/.Xresources ~/
fi



echo ""
echo ""
echo "Setting Xorg..."
#--------------------Setting Xorg
#setup monitors: nvidia-xconfig
#sudo vim /etc/X11/xorg.conf
#xrandr --setprovideroutputsource radeon Intel
#xrandr --output HDMI-1 --auto --above LVDS1


echo ""
echo ""
echo "Setting Display Manager..."
#--------------------Install Display Manager
#systemctl enable lightdm.service
#printf "[Seat:*] greeter-session=lightdm-gtk-greeter"
#sudo vim /etc/lightdm/lightdm.conf


echo "Multiline comment 1"
: '
echo ""
echo ""
echo "Cleaning..."
'

echo "Multiline comment 2"
: << 'COMMENT'

echo ""
echo ""
echo "Cleaning..."
sudo pacman -Scc
if [[ -f ~/.bash_history ]]
then
	rm ~/.bash_history
fi

if [[ -f ~/.bash_history ]]
then
	rm ~/.bash_history
fi

COMMENT