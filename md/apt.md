@apt
@linux

# Dowload source and compile (easy)

    apt-get source --compile awesome_package

# Dowload Source / Apply a patche / Compile and Install

    apt-get build-dep nautilus
    apt-get source nautilus

# save the patch in "nautilus-3.8.2/debian/patches/"

    echo ubuntu_revert_no_wallpaper.patch  >> nautilus-3.8.2/debian/patches/series
    apt-get --build source nautilus


# Purge broken package
        
    # Find bad package with dpkg -l pattern*
    apt-get --force-yes remove <package_name>
    dpkg --force-all --purge nom_du_paquet # || dpkg --force-all --remove <package_name>


# Search which package contains a file

    dpkg -S $(which a_command)
