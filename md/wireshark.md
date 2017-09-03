@network
@tcpdump

### Wireshark
https://blog.wireshark.org/2010/02/running-wireshark-as-you/

	sudo -s
	sudo apt-get install libcap2-bin
	groupadd -g wireshark
	usermod -a -G wireshark gerald
	chmod 750 /usr/bin/dumpcap
	setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap

### Tcpdump
TCPDUMP expressions

TCPDUMP expressions are also known as BPF, or Berkeley Packet Filters. On a TCPDUMP command line it is recommended to place them inside single quotes (UNIX) or double quotes (Windows) to avoid confusion and possible parsing errors.
Expressions

	tcpdump "host profl"
		dumps all packets to or from host profl
	tcpdump "ether host 11:22:33:44:55:66"
		dumps all packets to or from that MAC address
	tcpdump "net 192.168.12.4/30"
		dumps all packets to or from a network, specified using CIDR notation
	tcpdump "net 192.168.12.4 mask 255.255.255.252"
		dumps all packets to or from a network, specified using a mask
	tcpdump "tcp src port 53"
		dumps all packets with source port 22/tcp
	tcpdump "host {thisIP}"
		Show only IP traffic to or from thisIP
	tcpdump "host {thisIP} && host {thatIP}"
		Show only IP traffic between thisIP and thatIP
	tcpdump "!(host {myIP}) && {remainder of expression}"
		Ignore traffic from myIP (necessary if you're running TCPDUMP on a remote machine to stop it from local machine)

	Primitives

	icmp[0]
		Show only echo reply
	tcp[13] & 3 != 0
	tcp[tcpflags] & (tcp-syn | tcp-fin) != 0
		show only SYN or FIN packets
	tcp[13] & 0x12 != 0
	tcp[tcpflags] & (tcp-syn & tcp-ack) != 0
		show only SYN/ACK packets
	tcp[tcpflags] & (tcp-syn | tcp-fin | tcp-rst) != 0
		show SYN, FIN, and RST packets
	ip[2,2] > 576
		show only packets longer than 576 bytes
	icmp[0] = 3 and icmp[1] = 4
		Show ICMP type 3, code 4 (Needs fragmenting but DF bit set)
	ip[6] & 0x40 = 0x40
		Show only IP packets with DF bit set
	vlan && ip
		Show only IEEE 802.1q IP packets. Changes the decoding offsets for the remainder of the expression, as if the VLAN header had been stripped away.
	vlan 186 && ip
		Show only IP packets in IEEE 802.1q VLAN number 186.

	Assorted

	ip proto 50
		Show only ESP packets (IP protocol 50)
	ip proto 112
		show only VRRP packets (IP protocol 112)
	proto vrrp
		all VRRP packets (works on IPSO)



