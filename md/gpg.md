
**check a signature**

download the signature

    wget ...xxx.asc

import the signature

    gpg --import xxx.asc

check the sginature with content

    gpg --verify xxx.asc xxx.tar.bz2


**Encrypt a file/password (mutt case)**

generate a new pairs of keys (email `myemail@gpg.fr`)

    gpg --gen-key

Encrypt the secret file

    gpg -r myemail@gpg.fr -e ~/.mutt/password

In mutt descrypt the file with

    source "gpg -d ~/.mutt/password.gpg |"
