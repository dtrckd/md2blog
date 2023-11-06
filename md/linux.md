
Compile an test kernel 6 on Debian

    tar xf linux-6.6.tar.xz
    cd linux-6.6
    cp /boot/config-x.x.x-x-amd64 ./.config
    make olddefconfig
    make menuconfig
    make -j{NUM_CPU}
    make bindeb-pkg
    sudo apt install ../linux-image-6.6.0_6.6.0-1_amd64.deb
    sudo reboot
