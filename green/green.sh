#!/bin/sh
set -e

# Check for root
if [ "$(id -u)" != "0" ]; then
    echo "Green must be run with root"
    exit 1
fi

echo "Green Package Manager"

echo

ACTION="$1"
PKG="$2"

case "$ACTION" in
    install)
        echo "Package: $PKG"

        echo "Downloading $PKG.conf..."
        wget -q -O "/tmp/$PKG.conf" "https://raw.githubusercontent.com/Ietsiee/GreenOS/main/repo/$PKG.conf"

        echo "Loading $PKG.conf..."
        . "/tmp/$PKG.conf"       

        mkdir -p "/tmp/$PKG"

        echo "Downloading source..."
        wget -q -O "/tmp/$PKG/$PKG.$type" "$source"

        echo "Extracting..."
        tar -xf "/tmp/$PKG/$PKG.$type" -C "/tmp/$PKG"

        cd "/tmp/$PKG"

        echo "Building $PKG..."
        eval "$build"

        echo "Installing $PKG..."
        eval "$install"

        echo "Succesfully installed $PKG!"
        ;;

    *)
        echo "Unknown action: $ACTION"
        echo "Usage: green <action> <package>"
        ;;
esac


