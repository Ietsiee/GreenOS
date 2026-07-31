#!/bin/sh
set -e

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
