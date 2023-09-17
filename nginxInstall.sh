#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
sudo systemctl status nginx
curl -4 icanhazip.com
nginx -V
sudo systemctl status nginx
sudo systemctl start nginx
sudo -s
# vim /etc/nginx/conf.d/status.conf
# server {
#     listen 8080;
#     # Optionally: allow access only from localhost
#     # listen 127.0.0.1:8080;

#     server_name _;

#     location /status {
#         stub_status;
#     }
# }
nginx -t
systemctl reload nginx


