**install**

    apt install fail2ban postfix

restart

    service fail2ban restart

**query**

See active jail

    fail2ban-client status

Show IP banned in a jail

    fail2ban-client status <JAIL-NAME>

if you want to manually ban an IP

    fail2ban-client set <JAIL-NAME> banip <IP-ADDRESS>

if you want to manually unban an IP

    fail2ban-client set <JAIL-NAME> unbanip <IP-ADDRESS>



**Configure**

to receive email alert, set

    root: me@mydomain.tld

setup 

    sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

edit jail.local

    ignoreip = 127.0.0.1/8 [your_home_IP]
    ...
    bantime = 3600
    findtime = 600   # These lines combine to ban clients that fail
    maxretry = 6      # to authenticate 6 times within a half hour.

    # If mail configuration is ok 
    # mta = ... 
    # destmail = ..
    # sendername = = ... 

    # send mail whith whois and log line output
    action = %(action_mwl)s


**filter**

Enabled filter / edit jail.local

	cat >> /etc/fail2ban/jail.local <<EOF
	[nginx-badbots]
    enabled  = true
    port     = http,https
    filter   = nginx-badbots
    logpath  = /var/log/nginx/access.log
    maxretry = 2

	[nginx-noscript]
    enabled  = true
    port     = http,https
    filter   = nginx-noscript
    logpath  = /var/log/nginx/access.log
    maxretry = 6

    [nginx-noproxy]
    enabled  = true
    port     = http,https
    filter   = nginx-noproxy
    logpath  = /var/log/nginx/access.log
    maxretry = 2
    EOF

Create filters

	cd /etc/fail2ban/filter.d/

    # BADBOTS
	cp /etc/fail2ban/filter.d/apache-badbots.conf /etc/fail2ban/filter.d/nginx-badbots.conf

    # NOSCRIPT
	cat > /etc/fail2ban/filter.d/nginx-noscript.conf <<EOF
    [Definition]

    failregex = ^<HOST> -.*GET.*(\.php|\.asp|\.exe|\.pl|\.cgi|\.scgi)

    ignoreregex =
    EOF

    # NOPROXY
	cat > /etc/fail2ban/filter.d/nginx-noproxy.conf <<EOF
    [Definition]

    failregex = ^<HOST> -.*GET http.*
    # ddos: failregex = ^<HOST> -.*"(GET|POST).*HTTP.*"

    ignoreregex =
    EOF

