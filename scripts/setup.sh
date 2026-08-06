#!/bin/sh
set -e

cd "$HOME"

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone -q https://github.com/Ietsiee/GreenOS.git

echo "Creating GreenOS..."

sh "$HOME/GreenOS/scripts/rootfs.sh"
echo "Done! rootfs"

sh "$HOME/GreenOS/scripts/linux.sh"
echo "Done! Linux"

sh "$HOME/GreenOS/scripts/busybox.sh"
echo "Done! BusyBox"

sh "$HOME/GreenOS/scripts/build-linux.sh"
echo "Done! Build-Linux"

sh "$HOME/GreenOS/scripts/build-busybox.sh"
echo "Done! Build-BusyBox"

sh "$HOME/GreenOS/scripts/build-iso.sh"
ech "Done! Build-ISO"

echo
echo "Done! Setup"
