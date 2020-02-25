@vim


* [Vim tips and tricks](html/vim-tips-tricks/home.html)
https://www.cs.oberlin.edu/~kuperman/help/vim/home.html

## Cut long line (modify text)

    :%norm! gww

## Cut long line, when writting

```vim
:set fo?
:set fo+=t
% soft line break : :set wrap linebreak nolist
```

## justify text

    apt-get install par

then
:set formatprg=par\ -w50
then select line to align nand type `gq`.

# YCM

**build**

    cd ~/.vim/bundle/YouCompleteMe/
    mkdir build
    /usr/local/bin/cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu/libpython3.7.so -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m -DUSE_SYSTEM_BOOST=ON -DUSE_PYTHON2=OFF ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make

    # go binding
    cd ..
    cd third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls
    go build
