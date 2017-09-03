@apt
@linux

# Dowload Source / Apply a patche / Compile and Install
    apt-get build-dep nautilus
    apt-get source nautilus
#save the patch in "nautilus-3.8.2/debian/patches/"
    echo ubuntu_revert_no_wallpaper.patch  >> nautilus-3.8.2/debian/patches/series
    apt-get --build source nautilus

