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

        mkdir -p "/tmp/$package"

        echo "Downloading $PKG..."
        wget -q -O "/tmp/$package/$PKG.$type" "$source"

        echo "Extracting $PKG..."
        tar -xf "/tmp/$package/$PKG.$type" -C "/tmp/$PKG"

        echo "Preparing $PKG..."
        eval "$prepare"

        cd "/tmp/$package"

        echo "Configuring $PKG..."
        eval "$configure"

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


