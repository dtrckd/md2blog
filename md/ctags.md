# Use of ctags (great in use with taglist)

# recursive on current folder (RTFM)
ctags -R .

<CTRL-]> -- got to the object under cursor
<CTRL-t> -- got back

:ta <method> -- got to the method or list of method (ex: /^get) 
:ts -- shows the list.
:tn -- goes to the next tag in that list.
:tp -- goes to the previous tag in that list.
:tf -- goes to the function which is in the first of the list.
:tl -- goes to the function which is in the last of the list.

""""""""""""""""""""""""

C-W C-] - Open the definition in a horizontal split

Add these lines in vimrc
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

C-\ - Open the definition in a new tab
A-] - Open the definition in a vertical split

After the tags are generated. You can use the following keys to tag into and tag out of functions:

Ctrl-Left_MouseClick - Go to definition
Ctrl-Right_MouseClick - Jump back from definition


