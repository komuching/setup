#!/bin/bash

# Memastikan skrip dijalankan dengan hak akses sudo
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root or use sudo"
  exit
fi

# Update package list dan upgrade semua paket
sudo apt update && apt install sudo && sudo apt upgrade -y

# Install paket umum
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y git
sudo apt install -y unzip
sudo apt install -y build-essential
sudo apt install -y software-properties-common
sudo apt install -y net-tools
sudo apt install -y htop
sudo apt install -y nano vim
sudo apt install -y ca-certificates
sudo apt install -y tmux
sudo apt install -y jq
sudo apt install -y zip
sudo apt install -y tree

# Install UFW firewall dengan kebijakan default allow incoming dan outgoing
sudo apt install -y ufw
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw --force enable

# Install dan konfigurasi OpenSSH Server
sudo apt install -y openssh-server
sudo systemctl enable ssh

# Install Node.js LTS dan npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g npm@latest

# Install PM2
sudo npm install -g pm2
pm2 startup systemd

# Install Yarn, nodemon, dan TypeScript
sudo npm install -g yarn
sudo npm install -g nodemon
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

# Mengedit /etc/systemd/logind.conf
LOGIND_CONF="/etc/systemd/logind.conf"

# Backup file konfigurasi sebelum mengedit
if [ ! -f "${LOGIND_CONF}.bak" ]; then
  cp $LOGIND_CONF ${LOGIND_CONF}.bak
  echo "Backup of $LOGIND_CONF created at ${LOGIND_CONF}.bak"
fi

# Menambahkan atau memperbarui pengaturan
sed -i 's/^#*\(HandleLidSwitch=\).*/\1ignore/' $LOGIND_CONF
sed -i 's/^#*\(HandleLidSwitchDocked=\).*/\1ignore/' $LOGIND_CONF
sed -i 's/^#*\(IdleAction=\).*/\1ignore/' $LOGIND_CONF

echo "Updated $LOGIND_CONF with necessary settings."

# Restart layanan systemd-logind
echo "Restarting systemd-logind service..."
systemctl restart systemd-logind

echo "Configuration complete and service restarted."
