#!/bin/sh
set -e

cd "$HOME/GreenOS"

echo "Downloading musl..."
wget -q -O musl.tgz https://musl.cc/x86_64-linux-musl-native.tgz

echo "Extracting..."
tar -xzf musl.tgz
mv x86_64-linux-musl-native musl

echo "Removing musl.tgz..."
rm musl.tgz

echo "Copying musl to rootfs..."
cp -a "$HOME/GreenOS/musl/." "$HOME/GreenOS/rootfs/"
