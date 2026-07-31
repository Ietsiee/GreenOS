#!/bin/sh
set -e

cd

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone --depth 1 https://github.com/Ietsiee/GreenOS.git

echo "Creating rootfs..."
cd "$HOME/GreenOS/rootfs"
mkdir -p bin sbin etc proc sys dev tmp lib usr

echo "Creating init to rootfs..."
chmod +x init

cd "$HOME/GreenOS"

echo "Downloading Linux Kernel 6.18.38 (Longterm)..."
wget -q -O linux.tar.xz https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.38.tar.xz

echo "Extracting..."
tar -xf linux.tar.xz
mv linux-6.18.38 linux

echo "Removing linux.tar.xz..."
rm linux.tar.xz

echo "Copying linux .config..."
cp "$HOME/GreenOS/software/linux/.config" "$HOME/GreenOS/linux/.config"

echo "Cloning busybox..."
git clone -q --depth 1 --single-branch https://git.busybox.net/busybox.git

echo "Copying busybox .config..."
cp "$HOME/GreenOS/software/busybox/.config" "$HOME/GreenOS/busybox/.config"

echo "Downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "Extrating..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

cd ifetch

chmod +x modules/*
chmod +x ifetch.sh
chmod +x ifetch-launcher.sh

echo "Installing ifetch..."
sudo cp ifetch-launcher.sh "$HOME/GreenOS/rootfs/bin/ifetch"

mkdir -p "$HOME/GreenOS/rootfs/etc/ifetch"
cp ifetch.sh "$HOME/GreenOS/rootfs/etc/ifetch/ifetch.sh"
cp -r modules "$HOME/GreenOS/rootfs/etc/ifetch/modules"
cp help.txt "$HOME/GreenOS/rootfs/etc/ifetch/help.txt"
cp logo.txt "$HOME/GreenOS/rootfs/etc/ifetch/logo.txt"
cp ifetch.config "$HOME/GreenOS/rootfs/etc/ifetch/ifetch.config"

echo "Successfully installed ifetch"
