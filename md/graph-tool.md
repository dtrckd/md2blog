
# requirements.txt


    libboost-all-dev  libboost-python-dev
    expat libsparsehash-dev libcgal-dev 
    libcairo2-dev libcairomm-1.0-dev python3-cairo-dev
    libsparsehash-dev

    # If error on libbost, try: libboost1.62-all-dev

    # Eventual Graphics depedencies:
    aptitude install python3-gi python3-click python3-gi-cairo python3-cairo gir1.2-gtk-3.0

    # Alternative dependencies got from apt:
    #aptitude -s remove  python3-graph-tool
    #  The following packages will be REMOVED:  
    # libcdt5{u} libcgal12{u} libcgraph6{u} libgts-0.7-5{u} libgts-bin{u} libgv-python{u} libgvc6{u} libjs-jquery-ui{u} libpathplan4{u} libxdot4{u} python-cycler{u} python-dateutil{u} python-matplotlib{u} 
    # python-matplotlib-data{u} python-olefile{u} python-pil{u} python-pyparsing{u} python-subprocess32{u} python3-decorator{u} python3-graph-tool python3-numpy{u} python3-scipy{u}

# install.sh


    #!/bin/bash
    
    # to install in a local plcae, need to fore with:
    # make DESTDIR=$HOME/.local/ install
    #
    # Then move ~/.local/usr/lib/python... to .local/lib/python...
    
    #autogen.sh
    PYTHON=/usr/bin/python3.6 ./configure --with-boost-python=boost_python-py36 --prefix=/usr/local && \
        make -j3 &&
        make check &&
        sudo make install
    

