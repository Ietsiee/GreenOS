#!/bin/sh
set -e

cd "$HOME/GreenOS/rootfs"

echo "Building rootfs.img..."
find . -print0 | cpio --null -ov --format=newc | gzip > ../rootfs.img

echo "Copying rootfs.img..."
mv "$HOME/GreenOS/rootfs.img" "$HOME/GreenOS/GreenOS/boot/rootfs.img"

echo "Building GreenOS.iso..."
grub-mkrescue -o "$HOME/GreenOS/GreenOS.iso" "$HOME/GreenOS/GreenOS"

echo "Done! iso"
echo "GreenOS.iso in ~/GreenOS/GreenOS.iso"
