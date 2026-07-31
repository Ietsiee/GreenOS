#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "Extracting..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

cd ifetch

chmod +x modules/* ifetch.sh ifetch-launcher.sh

echo "Copying files..."
sudo cp ifetch-launcher.sh "$HOME/GreenOS/rootfs/bin/ifetch"

mkdir -p "$HOME/GreenOS/rootfs/etc/ifetch"
cp ifetch.sh help.txt logo.txt ifetch.config "$HOME/rootfs/etc/ifetch"
cp -r modules "$HOME/GreenOS/rootfs/etc/ifetch/modules"
