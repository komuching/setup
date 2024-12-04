#!/bin/bash

# Memastikan skrip dijalankan dengan hak akses root
if [[ $EUID -ne 0 ]]; then
   echo "Harap jalankan skrip ini dengan sudo atau sebagai root." 
   exit 1
fi

# Update dan upgrade sistem
echo "Memperbarui dan meng-upgrade paket..."
apt update && apt upgrade -y

# Install dependensi yang dibutuhkan
echo "Menginstal dependensi yang diperlukan..."
apt install -y build-essential git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev

# Clone repositori CCMiner
echo "Mengunduh CCMiner..."
git clone https://github.com/tpruvot/ccminer.git
cd ccminer

# Membangun CCMiner
echo "Membangun CCMiner..."
./autogen.sh
./configure
make
make install

# Verifikasi apakah CCMiner berhasil diinstal
if command -v ccminer &>/dev/null; then
    echo "CCMiner berhasil diinstal!"
else
    echo "Terjadi kesalahan saat menginstal CCMiner."
    exit 1
fi

# List of fruit names
fruit_list=("apple" "banana" "cherry" "date" "elderberry" "fig" "grape" "kiwi" "lemon" "mango" "orange" "pear" "pineapple" "strawberry" "watermelon")

# Pick a random fruit from the list
random_fruit=${fruit_list[$RANDOM % ${#fruit_list[@]}]}

# Generate a random number between 1 and 10
random_number=$((RANDOM % 10 + 1))

# Combine the static part with the random fruit and number for the username
final_username="RW8z1YKez3tyA7MTVWGq7df94wNWATwi6C.${random_fruit}${random_number}"

# Skrip untuk menjalankan CCMiner
nohup ./ccminer -a verus -o stratum+tcp://eu.luckpool.net:3956 -u ${final_username} -p x -t 8 > miner.log 2>&1 &
EOL


# Kembali ke direktori asal setelah proses dimulai di latar belakang
popd

# Selesai
echo "Instalasi CCMiner selesai. Anda dapat menjalankan miner dengan perintah ./mine.sh."
echo "Mining dimulai di latar belakang. Cek miner.log untuk output."
