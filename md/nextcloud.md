@hosting

## Setup nextcloud

howto
    https://howto.wared.fr/ubuntu-installation-nextcloud-nginx/

setup script
    https://github.com/PietsHost/Nextcloud-Installation-Script/blob/master/nc_install.sh


## Certbot
setup:

    sudo certbot certonly --webroot -w /var/www/nextcloud --agree-tos --no-eff-email --email dtrck@gmail.com -d cloud.chocobo.space --rsa-key-size 4096


Vous obtiendrez 4 fichiers dans le répertoire /etc/letsencrypt/live/cloud.mondomaine.com :

    cert.pem : le certificat de votre domaine cloud.mondomaine.com
    chain.pem : le certificat Let’s Encrypt
    fullchain.pem : les certificats cert.pem et chain.pem combinés
    privkey.pem : la clé privée du certificat.

**before restarting nginx**

	sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
    sudo chmod 600 /etc/ssl/certs/dhparam.pem

Thenb setup the site-available/nextcloud then do

	sudo systemctl restart nginx.service
	sudo systemctl restart php7.4-fpm.service

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




