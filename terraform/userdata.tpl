#!/bin/bash
apt update && apt upgrade -y
apt install nginx -y
systemctl enable nginx
systemctl start nginx
sudo bash -c 'echo Hello, this is your web server > /var/www/html/index.html'
