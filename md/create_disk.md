@linux
@recipe
@system

# Format a disk

    fdisk + mkfs
    # or 
    gparted

# Relabel disk

**Linux type (EXT/FAT32)**

    MTOOLS_SKIP_CHECK=1 mlabel -i /dev/sdb1 ::my-usb-key

**Windows type (NTFS)**

    ntfslabel /dev/sdb1 my-sub-key

# Repair corrupted disk

    fsck -r /dev/sdb1
    dosfsck -a /dev/sdb1
    mkfs.vfat /dev/sdb1


# Rescuscitate

     hdparm -r0 /dev/sdb # remove read-only flag
     dd if=/dev/zero of=/dev/sdb # erase
     fdisk /dev/sdb # n, a, t w.


# Copy an iso

     cp a.iso /dev/sdb
     # or
     dd if=a.iso of=/dev/sdb1


