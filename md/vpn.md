# aquilenet
```bash
wget https://atelier.aquilenet.fr/attachments/download/456/aqn.ovpn -P /etc/openvpn
cd /etc/openvpn
sed -i s/^auth-user-pass/auth-user-pass /etc/openvpn/identification_vpn/ /etc/openvpn/aqn.ovpn
umask 077 ; touch identification_vpn ; umask 022
echo $user >> identification_vpn
echo $pwd >> identification_vpn
mv /etc/openvpn/aqn.ovpn /etc/openvpn/aqn.conf

# DIgnore Ipv6
# add thes lines to asn.conf
pull-filter ignore "ifconfig-ipv6 "
pull-filter ignore "route-ipv6 "

# Auto Boot openvpn + add 'openvpn --config  /etc/openvpn/aqn.ovpn' in rc.local
echo 'AUTOSTART="aqn"' >> /etc/default/openvpn
systemctl start openvpn 
#reboot

# DNS de Aquilenet: 185.233.100.100 et 185.233.100.101
# DNS de FDN: 80.67.169.12 et 80.67.169.40

# myip
# Si elles commencent par 185.233.101.x ou 2a0c:e300:4: c'est que vous passez par le vpn aquilenet.
```

run the vpn with `openvpn /etc/openvpn/aqn.conf`
