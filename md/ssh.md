@ssh
@linux

see https://en.wikibooks.org/wiki/OpenSSH/Client_Configuration_Files

Create private and public keys (default -t rsa ???):

    ssh-keygen
    #.... The name-of-the-file
    #.... No password for passwordless login

    ssh-keygen -t ed25519 -C "gitea mirroring" -f ~/.ssh/id_ed25519 -N ""

Populate public key in a server for passwordless login

    ssh-copy-id -i <name-of-the-file> user@hostname
    # OR
    cat ~/.ssh/id_rsa.pub | ssh user@host 'cat >> ~/.ssh/authorized_keys'


add the public key in hosts_knows for authentification (avoid warning and error)

    echo  "hostname,ip-addr  $(cat <name-of-the-file.pub>)" >> ~/.ssh/known_hosts

Encrypt the new entry If ~/.ssh/known_hosts is encrypted (HashKnownHosts=True) :

    ssh-keygen -H

**List**

show fingerprint of a public key

    ssh-keygen -E sha256 -l -f ~/.ssh/id_rsa.pub

show/list fingerprint of authorized keys (sshd)

    ssh-keygen -l -f ~/.ssh/authorized_keys

**remove**

remove an entry from the authorized_keys

    sed -i.bak '/REGEX-USER-EMAIL/d' ~/.ssh/authorized_keys

remove a domain from known_hosts

    ssh-keygen -R my-code.skusku.site
