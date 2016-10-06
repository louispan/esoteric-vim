function! esoteric#save_key#setup()
    " save file easily in insert mode
    nmap <silent> <C-s> :w<CR>
    vmap <silent> <C-s> <C-c><C-s>gv
    imap <silent> <C-s> <C-o><C-s>
endfunction
