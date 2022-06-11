
# Install

pre-compiled binary 

    cd ~/Downloads
    curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
    gunzip elm.gz
    chmod +x elm
    sudo mv elm /usr/local/bin/

with npm 

    npm install --g elm

# Testing

open a browser app to browser elm rendered

    elm reactor

# Updating package

First remove the line pointing the package in the `elm.json` file, then type 

    elm install name/of/thepackage

# Tools

**elm-outdated**

Inspired from `npm outdated`

    npm i -g elm-outdated

**elm-spa**

    elm-spa --ui Html init
    elm-spa --ui Html add Hello
    elm-spa --ui Html element Path.Dynamic

# Plugin

https://github.com/ElmCast/elm-vim

For auto code completion and lookup, install

    npm install -g elm-oracle

# Analye

    npm install -g elm-analyse


# Learning

scaling app conf R. Feldman: https://www.youtube.com/watch?v=DoA4Txr4GUs

