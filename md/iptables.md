@linux

show nat table (don't resolve IP)

    iptables -L -n -t nat


###### Docker

Add the DOCKER-USER chain if missing

    iptables -N DOCKER-USER
    iptables -I FORWARD -j DOCKER-USER
    iptables -A DOCKER-USER -j RETURN
