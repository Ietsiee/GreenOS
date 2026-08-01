#!/bin/sh

cd "$HOME/GreenOS/linux"

echo "Building linux..."
make
echo "Done!"

echo "Copying bzImage..."
cp "$HOME/GreenOS/linux/arch/x86/bzImage" "$HOME/GreenOS/GreenOS/boot/bzImage"
echo "Done!"

echo "build-linux done!"
