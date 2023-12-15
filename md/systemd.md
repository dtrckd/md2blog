
**listing**

    systemctl list-unit-files
    systemctl list-units
    systemctl list-units -t service --full --all
    systemctl --state not-found --all
    systemctl --state failed --all
    systemctl --state masked --all


**clean**

    systemctl reset-failed

**debug**

    systemd-analyze verify <unit-name>

**links**

    https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files
