
**check a signature**

download the signature

    wget ...xxx.asc

import the signature

    gpg --import xxx.asc

check the sginature with content

    gpg --verify xxx.asc xxx.tar.bz2
