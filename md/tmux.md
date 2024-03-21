@tmux
@bash
@linux

https://cheatography.com/bechtold/cheat-sheets/tmux-the-terminal-multiplexer/

## Utils

reload tmuconf:

    <C-s>source-file ~/.tmux.conf
or

    <prefix> r

Rename a buffer:

    tmux rename -t _1-22097 2

Rename a session

    <C-S> S

Rename a window

    <C-S> A

Swap/switch pane:

    <C-s>swap-pane -t <pos>

Got resized from a smaller client. Exit tmux  and re attach with

    tmux attach -d [-t session]

Change the layout from/to vertical/horizontal

    <C-s> <A-S>[1-4]

## Pasting

Enable mouse scroll in tmux

    <C-s>: set [-g] mouse on

copy paste (see alsotmux list-buffers)

    <C-s>[             # go into paste mode
    <space> or <S-v>   # select a region
    <ENTER>            # to copy the selection
    <C-s>]             # to paste the selection
    or <C-s>=          # to see the paste buffer

or?

    <space> # go in selection mode
    (move)
    <space> to copy in the buffer
    (exit eventually ?)
    tmux save-buffer buffer.txt

if mouse is "on", just select the text with mouse, then you can paste directly with 

    <C-s>]

View paste buffers

    <C-s>: show-buffers
    <C-s>#


## Ressources

https://gist.github.com/russelldb/06873e0ad4f5ba1c4eec1b673ff4d4cd

http://www.deanbodenham.com/learn/tmux-conf-file.html

## Plugins

https://github.com/tmux-plugins/tpm

To enable plugins if tmux is already running:

    tmux source ~/.tmux.conf 

or tmux command:

     <prefix> I

