function! esoteric#erase_key#setup()
    " C-BS deletes linebackwards
    nmap     <silent> <C-BS> d:SmartLeftOnlyHomeKey<CR>
    vmap              <C-BS> <BS>
    imap              <C-BS> <C-o><C-BS>
    cnoremap          <C-BS> <C-U>

    noremap  <silent> <C-Del> d$
    vmap              <C-Del> <BS>
    imap              <C-Del> <C-O><C-Del>

    "C-S-BS deletes line backwards (like emacs)
    nmap     <silent> <C-S-BS> dd
    vmap              <C-S-BS> :<C-u>normal! dd<CR>gv
    imap              <C-BS>   <C-o><C-BS>
    cnoremap          <C-BS>   <End><C-u>

    " Backspace deletes in normal mode
    " delete using insert mode (not normal X) to delete indents faster
    nnoremap <silent> <BS>  i<BS><C-c>`^
    nnoremap <silent> <Del> x
    xnoremap <silent> <BS> x

    " alt moves by words
    nmap <silent> <M-BS> :<C-u>call esoteric#motions#wrapping_backspace_word()<CR>
    vmap <M-BS> <BS>
    imap <M-BS> <C-O><M-BS>
    cnoremap <M-BS> <C-W>

    " nmap <M-Del> d:call camelcasemotion#Motion('w', 1, 'n')<CR>
    nmap <M-Del> d<M-Right>
    vmap <M-Del> <BS>
    imap <M-Del> <C-O><M-Del>

endfunction
