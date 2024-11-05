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

# Install library tambahan yang diperlukan
sudo apt install -y libssl-dev       # Untuk SSL/TLS
sudo apt install -y libffi-dev       # Untuk beberapa dependensi enkripsi dan keamanan
sudo apt install -y zlib1g-dev       # Kompresi
sudo apt install -y libbz2-dev       # Bzip2 library
sudo apt install -y libreadline-dev  # Pengolahan input command line
sudo apt install -y libsqlite3-dev   # SQLite
sudo apt install -y libncurses5-dev  # Pengolahan UI berbasis teks
sudo apt install -y libgdbm-dev      # Database gdbm
sudo apt install -y libnss3-dev      # Network Security Services
sudo apt install -y liblzma-dev      # Kompresi LZMA
sudo apt install -y libxml2-dev      # Library XML
sudo apt install -y libxslt1-dev     # Library XSLT
sudo apt install -y libffi-dev       # FFI (Foreign Function Interface)
sudo apt install -y libcurl4-openssl-dev # Untuk mendukung cURL dengan SSL

# Bersihkan cache paket
sudo apt autoremove -y
sudo apt clean
