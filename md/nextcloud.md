@hosting

## Setup nextcloud

howto
    https://howto.wared.fr/ubuntu-installation-nextcloud-nginx/

setup script
    https://github.com/PietsHost/Nextcloud-Installation-Script/blob/master/nc_install.sh


## Certbot
setup:

    sudo certbot certonly --webroot -w /var/www/nextcloud --agree-tos --no-eff-email --email dtrck@gmail.com -d cloud.chocobo.space --rsa-key-size 4096

(check if cron.d/cerbot exists with the line

    0 */12 * * * root test -x /usr/bin/certbot -a \! -d /run/systemd/system && perl -e 'sleep int(rand(43200))' && certbot -q renew

to auto reload nginx after renew, add this line in /etc/letsencrypt/cli.ini

    renew-hook = systemctl reload nginx


## Setup backup

https://docs.nextcloud.com/server/13/admin_manual/maintenance/backup.html

```bash
cd /var/www/nextcloud
# maintenance mode
sudo -u nextcloud php occ maintenance:mode --on
cd ..
# copy folder
rsync -avx nextcloud/ /home/nextcloud/backups/temp/ && tar -zcf /home/nextcloud/backups/"$(date '+%Y-%m-%d').tar.gz" /home/nextcloud/backups/temp/
rm -r /home/nextcloud/backups/temp/

# 0 2 7 * *  #one per month le 7 a 2pm

# Remove backups and logs older than 20 days
find /home/nextcloud/backups -mtime +20 -type f -delete
cd nextcloud
sudo -u nextcloud php occ maintenance:mode --off
```


## restore backup
https://docs.nextcloud.com/server/13/admin_manual/maintenance/restore.html




