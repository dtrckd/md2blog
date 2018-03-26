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
     ./configure 
     CXX="/usr/bin/g++"             \
          ./configure --prefix=/usr/local \
          --enable-optimizations    \
          --enable-shared     \
          --with-system-expat \
          --with-system-ffi   \
          --with-ensurepip=yes &&
          make -j8
     #sudo make altinstall
     sudo make install
     sudo chmod 755 /usr/local/lib/libpython3.6m.so
     sudo chmod 755 /usr/local/lib/libpython3.so
     sudo ln -s /usr/local/lib/libpython3.so /usr/local/lib/libpython3.6.so


     # In case of lsb_release error when trying install pip with easy_install
     aptitude install lsb-core # (update-alternative set on python2.7)
