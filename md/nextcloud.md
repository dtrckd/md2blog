@hosting

## Setup nexrtcloud

setup script
    https://github.com/PietsHost/Nextcloud-Installation-Script/blob/master/nc_install.sh

howto
    https://howto.wared.fr/ubuntu-installation-nextcloud-nginx/


setup:

    sudo certbot certonly --webroot -w /var/www/nextcloud --agree-tos --no-eff-email --email dtrck@gmail.com -d cloud.chocobo.space --rsa-key-size 4096


## setup goaccess (net monitoring)

    apt install libncursesw5-dev libgeoip-dev

    wget https://tar.goaccess.io/goaccess-1.3.tar.gz
    tar -xzvf goaccess-1.3.tar.gz
    cd goaccess-1.3/

    ./configure --enable-utf8 --enable-geoip=legacy --with-openssl

    make
    make install


for nginx (not needed if log-format=COMBINED)

    cat << EOF >> /etc/goaccess.conf
    log-format %h %^[%d:%t %^] %v "%r" %s %b "%R" "%u" %^ %T %^
    time-format %H:%M:%S
    date-format %d/%b/%Y
    EOF

run

    sudo goaccess --log-format=COMBINED -f /var/log/nginx/access.log -o ~/report-goa.html --real-time-html -a -d --real-os \

        --ws-url=chocobo.space --port 7890
or better (all logs)
    sudo zcat -f /var/log/nginx/access.log* | sudo goaccess --log-format=COMBINED -o ~/report-goa.html --real-time-html -a -d --real-os \
        --ws-url=chocobo.space --port 7890




