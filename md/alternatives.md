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
