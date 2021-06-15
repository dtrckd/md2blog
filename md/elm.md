
# Install

pre-compiled binary 

    cd ~/Downloads
    curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
    gunzip elm.gz
    chmod +x elm
    sudo mv elm /usr/local/bin/

with npm 

    npm install --global elm

# Testing

open a browser app to browser elm rendered

    elm reactor

# Tools

**elm-spa**

elm-spa --ui Html init
elm-spa --ui Html add Hello
elm-spa --ui Html element Path.Dynamic

# Plugin

https://github.com/ElmCast/elm-vim

auto code completion and lookup, install

    npm install -g elm-oracle


# Learning

scaling app conf R. Feldman: https://www.youtube.com/watch?v=DoA4Txr4GUs
