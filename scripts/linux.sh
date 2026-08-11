#!/bin/sh
set -e

cd "$HOME/GreenOS"

rm -rf linux

echo "Downloading linux..."
wget -q -O linux.tar.xz https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.38.tar.xz

echo "Extracting linux..."
tar -xf linux.tar.xz
mv linux-6.18.38 linux
rm linux.tar.xz

cd "$HOME/GreenOS/linux"

echo "Configuring linux..."
cp "$HOME/GreenOS/software/linux/.config" "$HOME/GreenOS/linux/.config"

echo "Building linux..."
make -j"$(nproc)"

echo "Copying bzImage..."
cp "$HOME/GreenOS/linux/arch/x86/bzImage" "$HOME/GreenOS/GreenOS/boot/bzImage"

echo "Done! linux"
