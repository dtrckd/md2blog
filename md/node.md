@node

env error resolve in some distribution by:
    sudo ln -s "$(which nodejs)" /usr/bin/node

Configure module path
    echo 'export NODE_PATH="'$(npm root -g)'"'

list pavkage
    npm list [-g] [--depth 0]

inside a package, test and show error (dependenciye typically)
    npm test

Run a module 
    npm start


# Packages

**nodemon**: hot reload server on changed
i:

    npm install nodemon

ex:

    scripts {
      "start": "nodemon server/main"
    }

**webpack**: frontend builder, module bundler (alternative are Grunt and Gulp)
i:

    # webpack development dependency
    npm install webpack webpack-cli webpack-dev-server -D

    # Elm webpack integration
    npm i elm-webpack-loader file-loader

    # css (scss/sass) integration
    npm i sass-loader node-sass css-loader style-loader -D

    # PLUGIN
    npm install copy-webpack-plugin -D

ex:
    https://uhlenheuer.net/posts/2018-07-22-elm_webpack_setup.html
    https://webpack.js.org/loaders/file-loader/

    "scripts": {
      "build": "webpack --mode production",
      "dev": "webpack --mode development",
      "client": "webpack-dev-server --port 3000 --mode development" // --hot --inline
    }







