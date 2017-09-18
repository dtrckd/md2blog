@linux
@kernel

update this from "pocket".

## Gettting and Settings a Linux Kernel
	aptitude install kernel-package fakeroot build-essantial ncurses-dev

Get a kernel
    tar xvf kernel.tar.xz

Set kernel
    cp some-config .config
    make oldconfig OR make menuconfig

#### Debian (.deb)
    make-kpkg clean
    sudo time fakeroot make-kpkg -j4 --initrd kernel_image # kernel_headers
    cd ..
    sudo dpki -i  linux-image*.deb

#### Basic way
    aptitude build-dep linux
    sudo make
    sudo make modules_install
    sudo make install




