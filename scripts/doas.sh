#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Cloning Doas..."
git clone -q https://github.com/Duncaen/OpenDoas.git
mv OpenDoas opendoas

cd "$HOME/GreenOS/opendoas"

echo "Building Doas..."
./configure --prefix=/usr
make
sudo make DESTDIR="$HOME/GreenOS/rootfs" install
ln -s "$HOME/GreenOS/rootfs/usr/bin/doas" "$HOME/GreenOS/rootfs/usr/bin/sudo"
