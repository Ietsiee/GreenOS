#!/bin/sh
set -e

export PKG_CONFIG_SYSROOT_DIR="$HOME/GreenOS/rootfs"
export PKG_CONFIG_PATH="$HOME/GreenOS/rootfs/usr/lib/pkgconfig:$HOME/GreenOS/rootfs/usr/share/pkgconfig"

export CFLAGS="--sysroot=$HOME/GreenOS/rootfs -I$HOME/GreenOS/rootfs/usr/include"
export CXXFLAGS="--sysroot=$HOME/GreenOS/rootfs -I$HOME/GreenOS/rootfs/usr/include"
export LDFLAGS="--sysroot=$HOME/GreenOS/rootfs -L$HOME/GreenOS/rootfs/usr/lib"

mkdir -p "$HOME/GreenOS/mango"

cd "$HOME/GreenOS/mango"
echo "Building pcre2..."
git clone https://github.com/PCRE2Project/pcre2.git
cd pcre2
./autogen.sh
./configure --prefix=/usr
make
DESTDIR="$HOME/GreenOS/rootfs" make install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building hwdata..."
git clone https://github.com/vcrhonek/hwdata.git
cd hwdata
make
DESTDIR="$HOME/GreenOS/rootfs" make install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building cjson..."
git clone https://github.com/DaveGamble/cJSON.git
cd cJSON
cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
cmake --build build
DESTDIR="$HOME/GreenOS/rootfs" cmake --install build
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libdrm..."
git clone https://gitlab.freedesktop.org/mesa/drm.git libdrm
cd libdrm
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building pixman..."
git clone https://gitlab.freedesktop.org/pixman/pixman.git
cd pixman
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libdisplay-info..."
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info.git
cd libdisplay-info
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libliftoff..."
git clone https://github.com/emersion/libliftoff.git
cd libliftoff
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libxkbcommon..."
git clone https://github.com/xkbcommon/libxkbcommon.git
cd libxkbcommon
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building wayland..."
git clone https://gitlab.freedesktop.org/wayland/wayland.git
cd wayland
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building wayland-protocols..."
git clone https://gitlab.freedesktop.org/wayland/wayland-protocols.git
cd wayland-protocols
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libinput..."
git clone https://gitlab.freedesktop.org/libinput/libinput.git
cd libinput
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building seatd..."
git clone https://git.sr.ht/~kennylevinsen/seatd
cd seatd
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building libxcb..."
git clone https://gitlab.freedesktop.org/xorg/lib/libxcb.git
cd libxcb
cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
cmake --build build
DESTDIR="$HOME/GreenOS/rootfs" cmake --install build
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building xorg-xwayland..."
git clone https://gitlab.freedesktop.org/xorg/xserver.git xserver
cd xserver
meson setup build --prefix=/usr -Dxwayland=true -Dxorg=false
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building pango..."
git clone https://gitlab.gnome.org/GNOME/pango.git
cd pango
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building wlroots..."
git clone -b 0.20.2 https://gitlab.freedesktop.org/wlroots/wlroots.git
cd wlroots
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building scenefx..."
git clone -b 0.5 https://github.com/wlrfx/scenefx.git
cd scenefx
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
cd "$HOME/GreenOS/mango"

echo "Building mango..."
git clone https://github.com/mangowm/mango.git
cd mango
meson setup build --prefix=/usr
ninja -C build
DESTDIR="$HOME/GreenOS/rootfs" ninja -C build install
echo "Done!"
