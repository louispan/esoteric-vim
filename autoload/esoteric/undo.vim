" A function to clear the undo history
" http://superuser.com/questions/214696/how-can-i-discard-my-undo-history-in-vim
function! esoteric#undo#clear()
    let old_undolevels = &undolevels
    set undolevels=-1
    exe "normal a \<BS>\<Esc>"
    let &undolevels = old_undolevels
    unlet old_undolevels
endfunction
