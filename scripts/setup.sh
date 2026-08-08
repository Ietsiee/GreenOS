#!/bin/sh
set -e

cd "$HOME"

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone -q https://github.com/Ietsiee/GreenOS.git

sh "$HOME/GreenOS/scripts/rootfs.sh"

sh "$HOME/GreenOS/scripts/e2fsprogs.sh"

sh "$HOME/GreenOS/scripts/busybox.sh"

sh "$HOME/GreenOS/scripts/linux.sh"

sh "$HOME/GreenOS/scripts/iso.sh"

echo
echo "Done! setup"
