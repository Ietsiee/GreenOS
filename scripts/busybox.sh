#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Cloning busybox..."
git clone -q --depth 1 --single-branch https://git.busybox.net/busybox.git

echo "Copying busybox .config..."
cp "$HOME/GreenOS/software/busybox/.config" "$HOME/GreenOS/busybox/.config"

