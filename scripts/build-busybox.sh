#!/bin/sh
set -e

cd "$HOME/GreenOS/busybox"

rm -rf "$HOME/GreenOS/rootfs/bin/*"

echo "Building busybox..."
make install CONFIG_PREFIX="$HOME/GreenOS/rootfs"
echo "Done!"
