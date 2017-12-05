@python
@linux

see all alternatives:

    update-alternatives --all


see python alternatives:

    update-alternatives --list python

update from lower to highest priority:

    update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
    update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2


switch config:

    update-alternatives --config python


#### Compile python3 from source
     aptitude install build-essential
     aptitude install libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev 
     aptitude install ibgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev

     wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
     tar xf Python-3.6.1.tar.xz
     cd Python-3.6.1
     ./configure --enable-optimizations
     make -j 8
     sudo make altinstall

     # In case of lsb_release error when trying install pip with easy_install
     aptitude install lsb-core # (update-alternative set on python2.7)
