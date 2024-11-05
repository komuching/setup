#!/bin/bash
#!/bin/bash

#!/bin/bash

# Update package list dan upgrade semua paket
sudo apt update && sudo apt upgrade -y

# Install curl
sudo apt install -y curl

# Install wget
sudo apt install -y wget

# Install git
sudo apt install -y git

# Install unzip
sudo apt install -y unzip

# Install build-essential
sudo apt install -y build-essential

# Install software-properties-common
sudo apt install -y software-properties-common

# Install net-tools
sudo apt install -y net-tools

# Install htop
sudo apt install -y htop

# Install UFW firewall dengan kebijakan default allow incoming dan outgoing
sudo apt install -y ufw
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw --force enable

# Install nano dan vim
sudo apt install -y nano vim

# Install ca-certificates
sudo apt install -y ca-certificates

# Install tmux
sudo apt install -y tmux

# Install jq
sudo apt install -y jq

# Install zip
sudo apt install -y zip

# Install tree
sudo apt install -y tree

# Install OpenSSH Server
sudo apt install -y openssh-server
sudo systemctl enable ssh

# Install Node.js LTS dan npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g npm@latest

# Install PM2
sudo npm install -g pm2
pm2 startup systemd

# Install Yarn
sudo npm install -g yarn

# Install nodemon
sudo npm install -g nodemon

# Install TypeScript
sudo npm install -g typescript

# Bersihkan cache paket
sudo apt autoremove -y
sudo apt clean
