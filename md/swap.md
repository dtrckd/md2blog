Show which process are using swap

    sudo smem -rks swap

Create a swap on on VPS


    # Create a 3G swap file (it will adds to any existing swap !)
    sudo dd if=/dev/zero of=/swapfile bs=1M count=3072
    # Or alternatively
    #sudo fallocate -l 4G /swapfile

    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile


Optimize

    # Typical default value are 60 and 100.
    sudo sysctl vm.swappiness=30
    sudo sysctl vm.vfs_cache_pressure=50
    echo 'vm.swappiness=30' | sudo tee -a /etc/sysctl.conf
    echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf

Setup at bootime

    sudo cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

Check

    sudo swapon --show
    free -h

### Test of swap/VM configuration


Value first

```sh
sudo sysctl -w vm.swappiness=30
sudo sysctl -w vm.vfs_cache_pressure=50
sudo sysctl -w vm.min_free_kbytes=67584
sudo sysctl -w vm.dirty_background_ratio=10
sudo sysctl -w vm.dirty_ratio=20
```

value second

```sh
sudo sysctl -w vm.swappiness=10
sudo sysctl -w vm.vfs_cache_pressure=50
sudo sysctl -w vm.min_free_kbytes=67584
sudo sysctl -w vm.dirty_background_ratio=5
sudo sysctl -w vm.dirty_ratio=10
```

