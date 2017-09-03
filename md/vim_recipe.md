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

