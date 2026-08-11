#!/bin/sh
set -e

cd "$HOME/GreenOS"

rm -rf e2fsprogs

echo "Cloning e2fsprogs..."
git clone -q https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git

cd "$HOME/GreenOS/e2fsprogs"

echo "Configuring e2fsprogs..."
./configure --prefix=/

echo "Building e2fsprogs..."
make -j"$(nproc)"
 
echo "Installing e2fsprogs to rootfs..."
make DESTDIR="$HOME/GreenOS/rootfs" install

echo "Done! e2fsprogs"
