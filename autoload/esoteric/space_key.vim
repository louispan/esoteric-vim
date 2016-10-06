function! esoteric#space_key#setup()

    " Space inserts space in normal mode too, and moves cursor along
    noremap <silent> <SPACE>   i<SPACE><C-c>`^

    " Accidentally Shift-Space in insert mode doesn't exit to normal
    imap    <silent> <S-SPACE> <SPACE>

endfunction
