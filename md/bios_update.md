
# Dowload a new bios

seek on https://pcsupport.lenovo.com/fr/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x220/downloads/ds018807
suppose we downlad the file 8duj31us.iso 

convert iso to img

    #genisoimage -o bios.img 8duj31us.iso # dont seem to work from the eponym package
    wget https://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/geteltorito/geteltorito.pl
    perl geteltorito.pl -o bios2.img 8duj31us.iso 

copy image into a flash disk

    sudo dd if=bios.img of=/dev/sdd

reboot on that disk.
