#!/bin/sh
set -e

cd "$HOME"

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone -q https://github.com/Ietsiee/GreenOS.git

echo "Creating GreenOS..."

sh "$HOME/GreenOS/scripts/rootfs.sh"
echo "Done!"

sh "$HOME/GreenOS/scripts/linux.sh"
echo "Done!"

sh "$HOME/GreenOS/scripts/busybox.sh"
echo "Done!"

sh "$HOME/GreenOS/scripts/ifetch.sh"
echo "Done!"

echo "Setup done!"
echo "To build linux run: sh ~/GreenOS/scripts/build-linux.sh"
echo "To build busybox run: sh ~/GreenOS/scripts/build-busybox.sh"
echo
echo "To build the iso run: sh ~/GreenOS/scripts/build-iso.sh"
echo "Note: this will only work when you have build linux and busybox"
