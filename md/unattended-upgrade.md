debug

    unattended-upgrade -d --dry-run

install
    
    apt install powermgmt-base
    apt install unattended-upgrade
    systemctl restart unattended-upgrade
    systemctl enable unattended-upgrade

configure

    /etc/apt/apt.conf.d/50auto-upgrades

automatize

    /etc/apt/apt.conf.d/20auto-upgrades
