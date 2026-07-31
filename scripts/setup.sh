#!/bin/sh
set -e

cd "$HOME"

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone https://github.com/Ietsiee/GreenOS.git

sh "$HOME/GreenOS/scripts/rootfs.sh"
echo "Done!"

sh "$HOME/GreenOS/scripts/linux.sh"
echo "Done!"

sh "$HOME/GreenOS/scripts/busybox.sh"
echo "Done!

sh "$HOME/GreenOS/scripts/ifetch.sh"
echo "Done!
