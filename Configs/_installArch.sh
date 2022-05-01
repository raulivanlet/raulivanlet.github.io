#!/bin/bash


printf "\n GET PART 1 NAME:"
read PART_1
printf "\n GET PART 2 NAME:"
read PART_2
printf "\n GET PART 3 NAME:"
read PART_3
mkfs.fat -F32 /dev/$PART_1
mkswap /dev/$PART_2
mkfs.ext4 /dev/$PART_3

mount /dev/$PART_3 /mnt
swapon /dev/$PART_2
mkdir -p /mnt/boot
mount /dev/$PART_1 /mnt/boot


pacstrap /mnt base base-devel linux linux-firmware vim networkmanager
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime


LOCALE_GEN = "en_US.UTF-8 UTF-8"
printf "$LOCALE_GEN" >> /etc/locale.gen

LOCALE_CONF = "LANG=en_US.UTF-8"
printf "$LOCALE_CONF" >> vim /etc/locale.conf

locale-gen

HOSTNAME = "root"
printf "$HOSTNAME" >> /etc/hostname

passwd


mkinitcpio -P


pacman -Sy grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager


printf "\n GET USERNAME:"
read USERNAME  
useradd -g users -G wheel,storage,power -m $USERNAME
passwd $USERNAME


visudo


exit
umount -R /mnt