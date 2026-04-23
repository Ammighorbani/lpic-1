#! /bin/bash

sudo su -

# first of all make a backup of your grub.cfg
grub-mkconfig -o /boot/grub/grubbk.cfg && echo "grub back up done!"

# install byobu
apt install byobu -y && byobu-enable

