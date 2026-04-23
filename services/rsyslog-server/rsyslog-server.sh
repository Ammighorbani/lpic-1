#!/bin/bash

# This script have been writen for rsyslog server
# Author Amir Mahdi Ghorbani (Ammighorbani)




read -p "Installing rsyslog (server / client)? " RSYSLOG
RSYSLOG=$(echo "$RSYSLOG" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
echo "$RSYSLOG"

if [ "$RSYSLOG" = "client" ]; then
    
    # 1- Update and install rsyslog on your rsyslog server
    sudo apt update && sudo apt install rsyslog -y


    # 2- Enable, start and check status of rsyslog.service
    sudo systemctl enable rsyslog && sudo systemctl start rsyslog && sudo systemctl status rsyslog


    # 3- Make a backup of files
    sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.back

    # 4- Add logs sender in rsyslog client configuration file
    read -p "Enter rsyslog server IP: " RSYSLOG_IP
    RSYSLOG_IP=$(echo "$RSYSLOG_IP" | tr '[:upper:]' '[:lower:]')
    echo "$RSYSLOG_IP"


    read -p "TCP (recommended) or UDP? " TCP_UDP
    TCP_UDP=$(echo "$TCP_UDP" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
    echo "$TCP_UDP"

    if [ "$TCP_UDP" = "tcp" ]; then
        
        sudo echo "*.* @@$RSYSLOG_IP:514" >> /etc/rsyslog.conf

    elif [ "$TCP_UDP" = "udp" ]; then

        sudo echo "*.* @$RSYSLOG_IP:514" >> /etc/rsyslog.conf

    else

        echo "Invalid input"

    fi

    # 5- Restart rsyslog service
    sudo systemctl restart rsyslog && sudo systemctl status rsyslog


    echo "rsyslog client done!"

elif [ "$RSYSLOG" = "server" ]; then

    # 1- Update and install rsyslog on your rsyslog server
    sudo apt update && sudo apt install rsyslog -y


    # 2- Enable, start and check status of rsyslog.service
    sudo systemctl enable rsyslog && sudo systemctl start rsyslog && sudo systemctl status rsyslog


    # 3- Make a backup of files
    sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.back


    # 4- Enable TCP/UDP for listening
    read -p "TCP (recommended) or UDP? " TCP_UDP
    TCP_UDP=$(echo "$TCP_UDP" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
    echo "$TCP_UDP"

    if [ "$TCP_UDP" = "tcp" ]; then
        
        sudo cat tcp.txt > /etc/rsyslog.conf

    elif [ "$TCP_UDP" = "udp" ]; then

        sudo cat udp.txt > /etc/rsyslog.conf

    else

        echo "Invalid input"

    fi


    # 5- Create logs directory
    sudo mkdir -p /var/log/remote
    sudo chmod 755 /var/log/remote
    sudo chown -R syslog:root /var/log/remote/


    # 6- Save rsyslog client logs
    sudo cat remote-conf.txt > /etc/rsyslog.d/remote.conf


    # 7- If you have any firewall we are trying to open TCP/UDP port
    read -p "Do you have any firewall (y/n)? " IS_FIREWALL
    IS_FIREWALL=$(echo "$IS_FIREWALL" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
    echo "$IS_FIREWALL"


    if [ "$IS_FIREWALL" = "y" ]; then

        if [ "$TCP_UDP" = "tcp" ]; then
        
            sudo firewall-cmd --permanent --add-port=514/tcp
            sudo firewall-cmd --reload
            sudo ufw allow 514/tcp

        elif [ "$TCP_UDP" = "udp" ]; then

            sudo firewall-cmd --permanent --add-port=514/udp
            sudo firewall-cmd --reload
            sudo ufw allow 514/udp

        fi

    fi


    # 8- Restart rsyslog service
    sudo systemctl restart rsyslog && sudo systemctl status rsyslog


    echo "rsyslog server done!"

else

    echo "Invalid input"

fi










# client:
# # 1- Update and install rsyslog on your rsyslog server
# sudo apt update && sudo apt install rsyslog -y


# # 2- Enable, start and check status of rsyslog.service
# sudo systemctl enable rsyslog && sudo systemctl start rsyslog && sudo systemctl status rsyslog


# # 3- Make a backup of files
# sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.back

# # 4- Add logs sender in rsyslog client configuration file
# read -p "Enter rsyslog server IP: " RSYSLOG_IP
# RSYSLOG_IP=$(echo "$RSYSLOG_IP" | tr '[:upper:]' '[:lower:]' | tr -cd '[:digit:]')
# echo "$RSYSLOG_IP"


# read -p "TCP (recommended) or UDP? " TCP_UDP
# TCP_UDP=$(echo "$TCP_UDP" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
# echo "$TCP_UDP"

# if [ "$TCP_UDP" = "tcp" ]; then
    
#     sudo echo "*.* @@$RSYSLOG_IP:514" >> /etc/rsyslog.conf

# elif [ "$TCP_UDP" = "udp" ]; then

#     sudo echo "*.* @$RSYSLOG_IP:514" >> /etc/rsyslog.conf

# else

#     echo "Invalid input"

# fi

# # 5- Restart rsyslog service
# sudo systemctl restart rsyslog && sudo systemctl status rsyslog


# echo "rsyslog client done!"




# server:
# # 1- Update and install rsyslog on your rsyslog server
# sudo apt update && sudo apt install rsyslog -y


# # 2- Enable, start and check status of rsyslog.service
# sudo systemctl enable rsyslog && sudo systemctl start rsyslog && sudo systemctl status rsyslog


# # 3- Make a backup of files
# sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.back


# # 4- Enable TCP/UDP for listening
# read -p "TCP (recommended) or UDP? " TCP_UDP
# TCP_UDP=$(echo "$TCP_UDP" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
# echo "$TCP_UDP"

# if [ "$TCP_UDP" = "tcp" ]; then
    
#     sudo cat tcp.txt > /etc/rsyslog.conf

# elif [ "$TCP_UDP" = "udp" ]; then

#     sudo cat udp.txt > /etc/rsyslog.conf

# else

#     echo "Invalid input"

# fi


# # 5- Create logs directory
# sudo mkdir -p /var/log/remote
# sudo chmod 775 /var/log/remote
# sudo chown -R root:syslog remote/


# # 6- Save rsyslog client logs
# sudo cat remote-conf.txt > /etc/rsyslog.d/remote.conf


# # 7- If you have any firewall we are trying to open TCP/UDP port
# read -p "Do you have any firewall? " IS_FIREWALL
# IS_FIREWALL=$(echo "$IS_FIREWALL" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alpha:]')
# echo "$IS_FIREWALL"


# if [ "$IS_FIREWALL" = "y" ]; then

#     if [ "$TCP_UDP" = "tcp" ]; then
    
#         sudo firewall-cmd --permanent --add-port=514/tcp
#         sudo firewall-cmd --reload
#         sudo ufw allow 514/tcp

#     elif [ "$TCP_UDP" = "udp" ]; then

#         sudo firewall-cmd --permanent --add-port=514/udp
#         sudo firewall-cmd --reload
#         sudo ufw allow 514/udp

#     fi

# fi


# # 8- Restart rsyslog service
# sudo systemctl restart rsyslog && sudo systemctl status rsyslog


# echo "rsyslog server done!"