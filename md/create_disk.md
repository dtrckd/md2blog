@linux
@recipe
@system

# repair corrupted disk 

    fsck -r /dev/sdb1
    dosfsck -a /dev/sdb1
    mkfs.vfat /dev/sdb1

# Relabel a USB/Drive
    MTOOLS_SKIP_CHECK=1 mlabel -i /dev/sdb1 ::MARS


# Rescuscitate

     hdparm -r0 /dev/sdb # remove read-only flag
     dd if=/dev/zero of=/dev/sdb # erase
     fdisk /dev/sdb # n, a, t w.


# Copy an iso
     cp a.iso /dev/sdb 
     # or
     dd if=a.iso of=/dev/sdb1


