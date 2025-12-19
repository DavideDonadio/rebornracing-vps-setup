#!/bin/bash
# Update package index
sudo apt update

# Install noip2
sudo apt install -y noip2

# Install Certbot
sudo apt install -y certbot

# Install Nginx
sudo apt install -y nginx

# Install Fail2Ban
sudo apt install -y fail2ban

echo "All packages installed successfully."
