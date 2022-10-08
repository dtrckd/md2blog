# Goaccess

Use to report and analyse log

Setup goaccess

    apt install libncursesw5-dev libgeoip-dev
    # apt installlibmaxminddb-dev # --enable-geoip=mmdb

    wget https://tar.goaccess.io/goaccess-1.3.tar.gz
    tar -xzvf goaccess-1.3.tar.gz
    cd goaccess-1.3/

    ./configure --enable-utf8 --enable-geoip=legacy --with-openssl

    make
    make install


Real-time run

    goaccess access.log -o /var/www/html/report.html --log-format=COMBINED --real-time-html

pre run in all existing logs

    zcat -f /var/log/nginx/access.log* | goaccess --log-format=COMBINED -a -d --real-os -o /var/www/private/stats.html 

Other options...

    goaccess /var/log/nginx/access.log --log-format=COMBINED  -o /var/www/private/stats.html --real-time-html -a -d --real-os --ws-url=chocobo.space --port 7890 [--ssl-cert /etc/letsencrypt/live/cloud.chocobo.space/cert.pem --ssl-key /etc/letsencrypt/live/cloud.chocobo.space/privkey.pem]


For nginx (not needed if log-format=COMBINED)

    cat << EOF >> /etc/goaccess.conf
    log-format %h %^[%d:%t %^] %v "%r" %s %b "%R" "%u" %^ %T %^
    time-format %H:%M:%S
    date-format %d/%b/%Y
    EOF








