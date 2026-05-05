#!/bin/bash

# This script have been writen to create grafana log monitoring server
# Author Amir Mahdi Ghorbani (Ammighorbani)

echo "
|------------------------------------------------|
|                                                |
|     1 rsyslog + promtail + loki + grafana      |
|                                                |
|------------------------------------------------|
|                                                |
|   2 (rsyslog + promtail) + (loki + grafana)    |
|                                                |
|------------------------------------------------|
"


# Find runing directory
RUN_DIR=$(pwd)

# Giving grafana server structure
read -p "Install (1 / 2)? " GRAFANA_MODEL
echo "structure: $GRAFANA_MODEL"

read -p "What is you loki server IP? " LOKI_IP
echo "Loki server: $LOKI_IP"

if [ "$GRAFANA_MODEL" = "2" ]; then

    read -p "Installing on grafana server or rsyslog server (g / r)? " GR_SERVER

    if [ "$GR_SERVER" = "G" || "$GR_SERVER" = "g" ]; then

        # Create a system user for loki
        sudo useradd --system loki

        # Create directory and change owner
        sudo mkdir -p /etc/loki /var/lib/loki
        sudo chown loki:loki /var/lib/loki

        # Install loki from github
        sudo cd /usr/local/bin
        wget https://github.com/grafana/loki/releases/download/v2.9.0/loki-linux-amd64.zip

        # Install unzip to unzip files
        sudo apt install unzip -y

        # Unzip loki file and change name
        sudo unzip loki-linux-amd64.zip
        sudo mv loki-linux-amd64.zip loki

        # Make it executable
        sudo chmod +x /usr/local/bin/loki

        # Create loki configuration
        # sudo cat $RUN_DIR/loki-config.yml > /etc/loki/config.yml

        # Create loki directories
        sudo mkdir -p /var/lib/loki/{chunks,index,index_cache,compactor,wal}
        sudo chown -R loki:loki /var/lib/loki

        # Create systemd for loki
        # sudo cat $RUN_DIR/loki-systemd > /etc/systemd/system/loki.service

        # Activate loki service
        sudo systemctl daemon-reload 
        sudo systemctl enable loki 
        sudo systemctl start loki 
        sudo systemctl status loki > $RUN_DIR/loki.status

        # Check loki activation
        sudo curl http://localhost:3100/ready

        # Install grafana requires
        sudo apt install apt-transport-https software-properties-common wget -y

        # Add grafana repository
        sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list

        # Update packages list
        sudo apt update

        # Install grafana
        sudo apt install grafana -y

        # Activate grafana service
        sudo systemctl enable grafana-server
        sudo systemctl start grafana-server
        sudo systemctl status grafana-server > $RUN_DIR/grafana.service
    
    elif [ "$GR_SERVER" = "R" || "$GR_SERVER" = "r" ]; then

          # Install promtail
          sudo cd /usr/local/bin
          sudo wget https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip

          # Unzip promtail file and change name
          sudo unzip promtail-linux-amd64.zip
          sudo mv promtail-linux-amd64.zip promtail

          # Make it executable
          sudo chmod +x /usr/local/bin/loki

          # Create a system user for promtail
          sudo useradd --system promtail

          # Create directory and change owner
          sudo mkdir -p /etc/promtail /var/lib/promtail
          sudo chown promtail:promtail /var/lib/promtail

          # Create promtail configuration
        #   sudo cat $RUN_DIR/promtail-config.yml > /etc/promtail/config.yml
          sudo sed -i 's/<loki-server-ip>/$LOKI_IP/g' /etc/promtail/config.yml

          # Create systemd for promtail
        #   sudo cat $RUN_DIR/promtail-systemd > /etc/systemd/system/promtail.service

          # Change rsyslog directory permissions
          sudo chgrp -R syslog /var/log/remote

          # Add promtail user to syslog group
          sudo usermod -aG promtail syslog

          # Check promtail user
          id promtail
          
          # Activate promtail service
          sudo systemctl daemon-reload
          sudo systemctl enable promtail
          sudo systemctl start promtail
          sudo systemctl status promtail > $RUN_DIR/promtail.service

    else

        echo "Wronge input for g / r server"

    fi

elif [ "$GRAFANA_MODEL" = "1" ]; then

      # Create a system user for loki
      sudo useradd --system loki

      # Create directory and change owner
      sudo mkdir -p /etc/loki /var/lib/loki
      sudo chown loki:loki /var/lib/loki

      # Install loki from github
      sudo cd /usr/local/bin
      wget https://github.com/grafana/loki/releases/download/v2.9.0/loki-linux-amd64.zip

      # Install unzip to unzip files
      sudo apt install unzip -y

      # Unzip loki file and change name
      sudo unzip loki-linux-amd64.zip
      sudo mv loki-linux-amd64.zip loki

      # Make it executable
      sudo chmod +x /usr/local/bin/loki

      # Create loki configuration
    #   sudo cat $RUN_DIR/loki-config.yml > /etc/loki/config.yml

      # Create loki directories
      sudo mkdir -p /var/lib/loki/{chunks,index,index_cache,compactor,wal}
      sudo chown -R loki:loki /var/lib/loki

      # Create systemd for loki
    #   sudo cat $RUN_DIR/loki-systemd > /etc/systemd/system/loki.service

      # Activate loki service
      sudo systemctl daemon-reload 
      sudo systemctl enable loki 
      sudo systemctl start loki 
      sudo systemctl status loki > $RUN_DIR/loki.status

      # Check loki activation
      sudo curl http://localhost:3100/ready

      # Install grafana requires
      sudo apt install apt-transport-https software-properties-common wget -y

      # Add grafana repository
      sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - && echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list

      # Update packages list
      sudo apt update

      # Install grafana
      sudo apt install grafana -y

      # Activate grafana service
      sudo systemctl enable grafana-server
      sudo systemctl start grafana-server
      sudo systemctl status grafana-server > $RUN_DIR/grafana.service

      # Install promtail
      sudo cd /usr/local/bin
      sudo wget https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip

      # Unzip promtail file and change name
      sudo unzip promtail-linux-amd64.zip
      sudo mv promtail-linux-amd64.zip promtail

      # Make it executable
      sudo chmod +x /usr/local/bin/loki

      # Create a system user for promtail
      sudo useradd --system promtail

      # Create directory and change owner
      sudo mkdir -p /etc/promtail /var/lib/promtail
      sudo chown promtail:promtail /var/lib/promtail

      # Create promtail configuration
    #   sudo cat $RUN_DIR/promtail-config.yml > /etc/promtail/config.yml
      sudo sed -i 's/<loki-server-ip>/$LOKI_IP/g' /etc/promtail/config.yml

      # Create systemd for promtail
    #   sudo cat $RUN_DIR/promtail-systemd > /etc/systemd/system/promtail.service

      # Change rsyslog directory permissions
      sudo chgrp -R syslog /var/log/remote

      # Add promtail user to syslog group
      sudo usermod -aG promtail syslog

      # Check promtail user
      id promtail

      # Activate promtail service
      sudo systemctl daemon-reload
      sudo systemctl enable promtail
      sudo systemctl start promtail
      sudo systemctl status promtail > $RUN_DIR/promtail.service

else
    
    echo "Wronge Input for structure"

fi