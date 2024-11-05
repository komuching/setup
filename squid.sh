#!/bin/bash

# Hentikan layanan Squid jika berjalan
echo "Menghentikan layanan Squid jika sedang berjalan..."
sudo systemctl stop squid

# Hapus instalasi Squid dan konfigurasi lama
echo "Menghapus instalasi Squid dan konfigurasi lama..."
sudo apt remove --purge -y squid
sudo rm -rf /etc/squid
sudo rm -rf /var/log/squid
sudo rm -rf /var/spool/squid
echo "Squid dan konfigurasi lama telah dihapus."

# Instal Squid
echo "Menginstal Squid..."
sudo apt update
sudo apt install -y squid
echo "Squid telah berhasil diinstal."

# Konfigurasi Squid untuk menggunakan port 32189 dan mengizinkan akses dari semua IP
echo "Mengonfigurasi Squid pada port 32189 dengan akses terbuka..."
sudo bash -c 'cat <<EOF > /etc/squid/squid.conf
http_port 32189
acl all src all
http_access allow all
EOF'
echo "Konfigurasi Squid selesai."

# Restart layanan Squid untuk menerapkan konfigurasi baru
echo "Memulai ulang layanan Squid untuk menerapkan konfigurasi..."
sudo systemctl restart squid
echo "Layanan Squid telah berhasil dijalankan dengan konfigurasi baru."

# Konfigurasi UFW untuk mengizinkan akses ke port 32189 TCP
echo "Mengonfigurasi UFW untuk mengizinkan akses ke port 32189 TCP..."
sudo ufw allow 32189/tcp
sudo ufw reload
echo "Aturan UFW untuk port 32189 TCP telah berhasil diterapkan."

# Tampilkan status layanan Squid untuk verifikasi
echo "Verifikasi status layanan Squid:"
sudo systemctl status squid

echo "============================================================"
echo "Squid Proxy telah berhasil diinstal dan dikonfigurasi."
echo "Proxy berjalan di port 32189 dan terbuka untuk semua IP."
echo "Port 32189 TCP telah dibuka di UFW."
echo "============================================================"
