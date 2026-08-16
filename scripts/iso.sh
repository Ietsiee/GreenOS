#!/bin/sh
set -e

cd "$HOME/GreenOS/rootfs"

echo "Building rootfs.cpio.gz..."
find . -print0 | cpio --null -o --format=newc | gzip -9 -n > ../rootfs.cpio.gz

echo "Copying rootfs.img..."
mv "$HOME/GreenOS/rootfs.cpio.gz" "$HOME/GreenOS/GreenOS/boot/rootfs.cpio.gz"

echo "Building GreenOS.iso..."
grub-mkrescue -o "$HOME/GreenOS/GreenOS.iso" "$HOME/GreenOS/GreenOS"

echo "Done! iso"
echo "GreenOS.iso in ~/GreenOS/GreenOS.iso"
