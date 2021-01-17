
# enable https

generate a certificate

openssl req -x509 -new -newkey rsa:2048 -nodes -keyout postal.key -out postal.crt

a,d then in yout /etc/nginx/site-available/site, add

    listen                        443 ssl http2;
    listen                        [::]:443 ssl http2;
    ssl on;
    ssl_certificate /etc/nginx/postal.crt;
    ssl_certificate_key /etc/nginx/postal.key;


# forward to reverse proxy

server {
    listen                        80;
    listen                        [::]:80;
    server_name                   postal.chocobo.space;
    return                        301 https://$server_name$request_uri;
}

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



