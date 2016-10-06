function! esoteric#undo_key#setup()
    nmap <silent>     <C-z> <Undo>
    vnoremap <silent> <C-z> :undo<CR>gv
    imap <silent>     <C-z> <C-o><Undo><C-o>i
    cnoremap <silent> <C-z> <Nop>

    nnoremap <silent> <Plug>CtrlShiftZ <C-R>
    vnoremap <silent> <Plug>CtrlShiftZ :redo<CR>gv
    imap <silent>     <Plug>CtrlShiftZ <C-o>:redo<CR>
    cnoremap <silent> <Plug>CtrlShiftZ <Nop>

    " <C-z> used to be suspend, so bind it to something else
    inoremap        <ESC>z <C-z>
    cnoremap        <ESC>z <C-z>

    " undo tree
    map <ESC>u :<C-u>UndotreeToggle<CR>
    imap <ESC>u :<C-o><ESC>u
endfunction
