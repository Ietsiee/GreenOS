#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Cloning busybox..."
git clone -q --depth 1 --single-branch https://git.busybox.net/busybox.git

cd "$HOME/GreenOS/busybox"

echo "Building busybox..."
cp "$HOME/GreenOS/software/busybox/.config" "$HOME/GreenOS/busybox/.config"
make install CONFIG_PREFIX="$HOME/GreenOS/rootfs"
