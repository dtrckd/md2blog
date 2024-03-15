@vim

* [Vim tips and tricks](html/vim-tips-tricks/home.html)
* https://www.cs.oberlin.edu/~kuperman/help/vim/home.html


To replace all occurrences of a term under the cursor in Vim, you can use the following command:

    :%s/<C-r><C-w>/new_term/g

Go to last active tab 

    g<Tab>


Open current window in a new tab

    Ctrl + w, Shift + t 


Insert newline between each line

    :s/\n/\r&/


Cut long line (modify text)

    :%norm! gww


Cut long line, when writting

    :set fo?
    :set fo+=t
    % soft line break : :set wrap linebreak nolist


justify text

    apt-get install par

then

    :set formatprg=par\ -w50

then select line to align and type `gq`.

## Ctags

    see [[ctags]]

## Folding


| Command | Description |
| --- | --- |
| `zc` | Close a fold |
| `zo` | Open a fold |
| `zC` | Close a fold and its children recursively |
| `zO` | Open a fold and its children recursively |
| `za` | Toggle fold status (open if closed, close if open) |
| `zM` | Close all folds in the file |
| `zR` | Open all folds in the file |
| `zx` | Decrease fold level (increase the number of lines displayed for a fold) |
| `zX` | Increase fold level (decrease the number of lines displayed for a fold) |
| `zd` | Delete a fold (remove the fold, but keep the text) |
| `zE` | Eliminate all folds (remove all folds, but keep the text) |

## Ycm

**build**

    # apt install cmake
    # apt install mono-complete golang nodejs default-jdk npm   # remove go and npm if manually installed...
    cd ~/.vim/bundle/YouCompleteMe/
    python3 install.py --all

    -- @obsolete

    cd ~/.vim/bundle/YouCompleteMe/
    mkdir build
    /usr/local/bin/cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu/libpython3.7.so -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m -DUSE_SYSTEM_BOOST=ON -DUSE_PYTHON2=OFF ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make

    # go binding
    cd ..
    cd third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls
    go build
