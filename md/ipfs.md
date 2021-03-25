@ipfs

Setup a node
---

initialize yout node account on a machine

    ipfs init

running a deamon (node) in a terminal

	ipfs daemon --routing=dhtclient --enable-namesys-pubsub


> Note the flags, they are important:
> 	The --enable-namesys-pubsub flag enables new and much faster IPFS resolution mechanism. You want that enabled always on both laptop and server nodes.
> 	The --routing=dhtclient flag enables prevents your node from routing all world’s IPFS traffic. You want that on your laptop only.


see address of your peers (as a  node)

	ipfs swarm peers


get node info
	
	ipfs id
	ipfs stats repo


Add a website
---

add a files (like a blog for examepl)

	ipfs add -r public/

that's it; site should be accessible by the world: 

	 curl https://gateway.pinata.cloud/ipfs/<hash>[/path]

Setup IPNS
---

generate a key (one per website)

	ipfs key gen --type=ed25519 skusku

Associate a content with Ipns
	
	ipfs name publish --key=krvtz /ipfs/QmRPSiHswBZghPjF4jJiqXiuVk9m4ovrAbU9B2nPKAKZSa
	|- Published to 12D3KooWPawvRcVQ3jM1Xq59JKr4BGwSDGkDKZk5JqH2H2tAqUKS: /ipfs/QmRPSiHswBZghPjF4jJiqXiuVk9m4ovrAbU9B2nPKAKZSa

then connect with the ipns address

	 curl https://gateway.pinata.cloud/ipns/12D3KooWPawvRcVQ3jM1Xq59JKr4BGwSDGkDKZk5JqH2H2tAqUKS

to resolve an ipns address 

	ipfs name resolve /ipns/12D3KooWPawvRcVQ3jM1Xq59JKr4BGwSDGkDKZk5JqH2H2tAqUKS


Show refs
---

show pin hash (addded)

	ipfs pin ls  [--type=recursive]


show local refs

	ipfs refs local

configure
---

change gateway address

    ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8081
