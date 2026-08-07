#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Downloading Linux..."
wget -q -O linux.tar.xz https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.38.tar.xz

echo "Extracting..."
tar -xf linux.tar.xz
mv linux-6.18.38 linux
rm linux.tar.xz

cd "$HOME/GreenOS/linux"

echo "Building linux..."
cp "$HOME/GreenOS/software/linux/.config" "$HOME/GreenOS/linux/.config"
make
cp "$HOME/GreenOS/linux/arch/x86/bzImage" "$HOME/GreenOS/GreenOS/boot/bzImage"
