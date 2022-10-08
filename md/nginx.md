
test conf syntax

    nginx -t

relaod nginx

    nginx -s reload

# enable https

generate a certificate

    openssl req -x509 -new -newkey rsa:2048 -nodes -keyout postal.key -out postal.crt

then write `/etc/nginx/site-available/site` as

```
listen                        443 ssl http2;
listen                        [::]:443 ssl http2;
ssl on;
ssl_certificate /etc/nginx/postal.crt;
ssl_certificate_key /etc/nginx/postal.key;
```

# enable HTTP bAsic auth

    apt install apache2-utils
    htpasswd -c /etc/nginx/certs/htpasswd admin
    # more user: htpasswd /etc/nginx/certs/htpasswd user2

    # add in sites's conf
        auth_basic           "Admin Area";
        auth_basic_user_file /etc/nginx/certs/htpasswd; 


# forward to reverse proxy

```
server {
    listen                        80;
    listen                        [::]:80;
    server_name                   postal.chocobo.space;
    return                        301 https://$server_name$request_uri;
}
```

```
server {
    listen                        443 ssl http2;
    listen                        [::]:443 ssl http2;
    ssl on;
    ssl_certificate /etc/nginx/postal.crt;
    ssl_certificate_key /etc/nginx/postal.key;
    server_name postal.chocobo.space;

    location / {
        proxy_pass         "http://127.0.0.1:5000";
        proxy_set_header   Host $http_host;
        #proxy_set_header  X-Forwarded-For $remote_addr;
        proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header  X-Forwarded-Proto $scheme;
        proxy_set_header  X-Forwarded-Port $server_port;
        proxy_set_header  X-Forwarded-Host $host;
    }
}
```



