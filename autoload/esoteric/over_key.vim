function! esoteric#over_key#setup()
    map <ESC>; :OverCommandLine<CR>
    imap <ESC>; <C-o>:OverCommandLine<CR>
endfunction
