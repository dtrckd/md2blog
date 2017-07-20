@network

### Disable ipv6

##### Locally
> echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

##### Globally (persit after reboot)

###### method one
Edit in `/etc/sysctl.conf` : 
    # to disable IPv6 on all interfaces system wide
        net.ipv6.conf.all.disable_ipv6 = 1

    # to disable IPv6 on a specific interface (e.g., eth0, lo)
        net.ipv6.conf.lo.disable_ipv6 = 1
        net.ipv6.conf.eth0.disable_ipv6 = 1

###### method two
Edit in `/etc/default/grub ` : 
    GRUB_CMDLINE_LINUX="ipv6.disable=1"


##### Clean IPv6 flushing

* remove ivp6 alias in `/etc/hosts`
* set `AddressFamily inet`  in  `/etc/ssh/sshd_config`.  Restart sshd


