@node

env error resolve in some distribution by:
    sudo ln -s "$(which nodejs)" /usr/bin/node

Confugure module path                                                                                                                               
    echo 'export NODE_PATH="'$(npm root -g)'"'

inside a package, test and show error (dependenciye typically)
    npm test

Run a module 
    npm start




