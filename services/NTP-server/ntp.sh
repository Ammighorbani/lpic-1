#!/bin/bash

# This script have been writen for change configuration file of your ntp server and client
# If you are runing this script on your NTP server enter your NTP pool address
# If you are runing this script on your NTP client enter your NTP server address


# 1- Update and install ntp on your ntp server
sudo apt update && sudo apt install ntp -y

# 2- Get status of your ntp.service
sudo systemctl status ntp.service

# 3- Get backup of your original ntp.conf
sudo cp /etc/ntp.conf /etc/ntp.conf.back

# 4- Give ntp server ip address
read -p "How many NTP server do you have? " NTP_NUMBER

# 5- Change pool addresses
sudo cat starter-half.txt > /etc/ntp.conf

for ((i=1; i<=NTP_NUMBER; i++)); do
    
    read -p "Enter your NTP server ip/domain address [$i] : " SERVER
    NTP_SERVER[$i]="$SERVER"
    echo "pool $SERVER iburst" >> /etc/ntp.conf

done

for ((i=1; i<=NTP_NUMBER; i++)); do
    
    echo "NTP_SERVER[$i] = ${NTP_SERVER[$i]}"

done


sudo cat end-half.txt >> /etc/ntp.conf

# 6- Check /etc/ntp.conf file
sudo cat /etc/ntp.conf

# 7- Restart ntp.service
sudo systemctl restart ntp.service

# 8- Check NTP queries
sudo ntpq -p

# 9- Set timezone to Tehran
sudo timedatectl set-timezone Asia/Tehran