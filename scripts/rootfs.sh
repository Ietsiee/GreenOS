#!/bin/sh
set -e

cd "$HOME/GreenOS/rootfs"

echo "Creating rootfs..."
mkdir -p bin sbin etc proc sys dev tmp lib usr var

cd "$HOME/GreenOS/rootfs/usr"

echo "Creating /usr to rootfs..."
mkdir -p bin sbin lib share

cd "$HOME/GreenOS/rootfs"

echo "Creating /tmp to rootfs..."
chmod 1777 "$HOME/GreenOS/rootfs/tmp"

echo "Creating init to rootfs..."
chmod +x "$HOME/GreenOS/rootfs/init"

echo "Done! rootfs"
