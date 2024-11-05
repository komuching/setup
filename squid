#!/bin/bash

# Update dan upgrade paket
sudo apt update && sudo apt upgrade -y

# Instal Squid dan apache2-utils untuk membuat pengguna autentikasi
sudo apt install -y squid apache2-utils

# Buat file autentikasi dan tambahkan user "qodrat" dengan password
# Anda akan diminta memasukkan password untuk user ini
sudo htpasswd -c /etc/squid/passwd qodrat

# Konfigurasi Squid untuk menggunakan autentikasi dasar
sudo bash -c 'cat <<EOF >> /etc/squid/squid.conf

# Autentikasi pengguna
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic realm "Squid Proxy Authentication"
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all
EOF'

# Restart layanan Squid untuk menerapkan perubahan
sudo systemctl restart squid

# Menampilkan status layanan Squid
sudo systemctl status squid

echo "Instalasi dan konfigurasi Squid selesai."
echo "Squid Proxy hanya dapat diakses oleh user 'qodrat' dengan autentikasi."
