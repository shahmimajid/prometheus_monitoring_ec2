#!/bin/bash
sudo useradd --no-create-home node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar xzf node_exporter-1.7.0.linux-amd64.tar.gz
sudo cp node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/node_exporter
cd node_exporter-1.7.0.linux-amd64
sudo cp node_exporter /usr/local/bin
cd ..
rm -rf node_exporter-*

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# sudo vi /etc/systemd/system/node_exporter.service
# [Unit]
# Description=Node Exporter
# Wants=network-online.target
# After=network-online.target

# [Service]
# User=node_exporter
# Group=node_exporter
# Type=simple
# ExecStart=/usr/local/bin/node_exporter
# Restart=always
# RestartSec=3

# [Install]
# WantedBy=multi-user.target

# Define the path of the systemd service file
SERVICE_FILE="/etc/systemd/system/node_exporter.service"

# Write the nodeexporter
sudo cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter


curl http://localhost:9100/metrics



