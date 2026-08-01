# GreenOS
**GreenOS** is a **minimal** and **open-source Linux distribution** that aims to stay as minimal as possible.

## Components
**GreenOS** uses these components
- **Linux** as the kernel
- **BusyBox** as userland
- **GRUB** as bootloader

## Installation
To install **GreenOS**, you can choose between building the **ISO** yourself (see [Creating ISO](#creating-iso)) or simply downloading the latest release here (coming soon)

## Creating ISO
To create the **ISO**, you need to install these **build dependencies:**

- git
- wget
- tar
- gzip
- GRUB
- cpio
- xorriso

These **dependencies** may have different **package names** depending on your **Linux distribution:**

- gcc
- make
- binutils
- bc
- flex
- bison
- perl

To start the **setup** run: ```curl -fsSL https://raw.githubusercontent.com/Ietsiee/GreenOS/main/scripts/setup.sh | sh``` The **setup.sh** script will clone **GreenOS**, create the **rootfs**, build **Linux** and **BusyBox**, and create the **ISO** at the end.
