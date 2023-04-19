**Use of ctags (great in use with taglist)**

recursive on current folder (RTFM)
	ctags -R


**Usage with vim**
from https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks

    Ctrl+] - go to definition
    Ctrl+t - Jump back from the definition.
    Ctrl+W Ctrl+] - Open the definition in a horizontal split. alternatively <C-W> <C-S>

    g+] see def in helper.

    Add these lines in vimrc
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

    Ctrl+\ - Open the definition in a new tab
    Alt+] - Open the definition in a vertical split

    After the tags are generated. You can use the following keys to tag into and tag out of functions:

    Ctrl+Left MouseClick - Go to definition
    Ctrl+Right MouseClick - Jump back from definition


---

    :ta <method> -- got to the method or list of method (ex: /^get)
    :ts -- shows the list.
    :tn -- goes to the next tag in that list.
    :tp -- goes to the previous tag in that list.
    :tf -- goes to the function which is in the first of the list.
    :tl -- goes to the function which is in the last of the list.




