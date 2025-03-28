@ssh
@linux

see https://en.wikibooks.org/wiki/OpenSSH/Client_Configuration_Files

**Create**

Create private and public keys (default -t rsa ???):

    ssh-keygen
    #.... The name-of-the-file
    #.... No password for passwordless login

    ssh-keygen -t ed25519 -C "gitea mirroring" -f ~/.ssh/id_ed25519 -N ""

Populate public key in a server for passwordless login

    ssh-copy-id -i <name-of-the-file> user@hostname
    # OR
    ssh user@host "echo $(cat ~/.ssh/my-key.pub) > /home/user/.ssh/authorized_keys"


add the public key in hosts_knows for authentification (avoid warning and error)

    echo  "hostname,ip-addr  $(cat <name-of-the-file.pub>)" >> ~/.ssh/known_hosts

Encrypt the new entry If ~/.ssh/known_hosts is encrypted (HashKnownHosts=True) :

    ssh-keygen -H

**list**

show fingerprint of a public key

    ssh-keygen -E sha256 -l -f ~/.ssh/id_rsa.pub

    # for added key
    ssh-add -l

show/list fingerprint of authorized keys (sshd)

    ssh-keygen -l -f ~/.ssh/authorized_keys

**remove**


Remove a specific key:
If you want to remove a specific key from the SSH agent, you need to provide the path to the key file. For example:

    ssh-add -d /path/to/your/private_key

To remove all keys from the SSH agent, use:

    ssh-add -D

remove an entry from the authorized_keys

    sed -i.bak '/REGEX-USER-EMAIL/d' ~/.ssh/authorized_keys

remove a domain from known_hosts

    ssh-keygen -R my-code.skusku.site

**generate certificate and key for ssl**


    sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout my_private.key -out my_certificate.crt

    # OR using ED25519 encryption protocl

    openssl genpkey -algorithm ED25519 -out my_private.key
    openssl req -new -x509 -key my_private.key -out my_certificate.crt -days 3650

