@tmux
@bash
@linux


Rename a buffer :
    tmux rename -t _1-22097 2

#### Pasting

Enable mouse scroll in tmux
    <C-s>: set [-g] mouse on

copy paste (see alsotmux list-buffers)
    <C-s>[             # go into paste mode
    <space> or <S-v>   # select a region
    <C-space>          # to copy the selection
    <C-s>]             # to paste the selection

if mouse is "on", just select the text with mouse, then you can paste directly with : `<C-s>]`

View paste buffers
    <C-s>: show-buffers
    <C-s>#



###### Next steps

tmux.conf ?
copy yo clipboard ?

###### Ressources

https://gist.github.com/russelldb/06873e0ad4f5ba1c4eec1b673ff4d4cd

