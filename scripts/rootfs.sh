#!/bin/sh
set -e

cd "$HOME/GreenOS/rootfs"

echo "Creating rootfs..."
mkdir -p bin sbin etc proc sys dev tmp lib usr

echo "Creating /tmp to rootfs..."
chmod 1777 "$HOME/GreenOS/rootfs/tmp"

echo "Creating init to rootfs..."
chmod +x "$HOME/GreenOS/rootfs/init"

echo "Creating green to rootfs..."
cp "$HOME/GreenOS/green/green.sh" "$HOME/GreenOS/rootfs/bin/green"
chmod +x "$HOME/GreenOS/rootfs/bin/green"
