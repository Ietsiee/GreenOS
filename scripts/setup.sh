#!/bin/sh
set -e

cd "$HOME"

rm -rf "$HOME/GreenOS"

echo "Cloning GreenOS..."
git clone -q https://github.com/Ietsiee/GreenOS.git

sh "$HOME/GreenOS/scripts/rootfs.sh"

sh "$HOME/GreenOS/scripts/e2fsprogs.sh"

sh "$HOME/GreenOS/scripts/busybox.sh"

echo "Build kernel now? (y/n)"
read answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo "Yes"
    sh "$HOME/GreenOS/scripts/linux.sh"
else
    echo "No"
    echo "sh ~/GreenOS/scripts/linux.sh to build linux"
    echo "sh ~/GreenOS/scripts/iso.sh to build the iso"
fi

sh "$HOME/GreenOS/scripts/iso.sh"

echo
echo "Done! setup"
