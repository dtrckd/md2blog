@python

# Html compilation Info 

    cython -a file.pyx

# What python lib are there

    /usr/bin/python3-config --libs

# Create a binary

    PYVERSION=3.6
    foobar: foobar.py
        cython --embed foobar.py -o foobar.c
        $(CC) -I /usr/include/python$(PYVERSION) foobar.c -lpython$(PYVERSION) -o foobar

