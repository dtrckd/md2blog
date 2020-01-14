
# install

pre-compiled binary 

    cd ~/Downloads
    curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
    gunzip elm.gz
    chmod +x elm
    sudo mv elm /usr/local/bin/

with npm 

    npm install --global elm

# test explore

open a browser app to browser elm rendered

    elm reactor

# Plugin

https://github.com/ElmCast/elm-vim

auto code completion and lookup, install

    npm install -g elm-oracle

