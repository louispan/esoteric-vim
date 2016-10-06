function! esoteric#commenter_key#setup()

        " ,cl : left aligned comments
        " ,cu : uncomment
        " ,cc : nestable comments
        let g:NERDCreateDefaultMappings = 0
        nmap <unique> <ESC>k<ESC> <ESC>k
        xmap <unique> <ESC>k<ESC> <ESC>k
        smap <unique> <ESC>k<ESC> <ESC>k
        imap <unique> <ESC>k<ESC> <ESC>k

        " (kk)omment
        nmap <unique> <ESC>kk <Plug>NERDCommenterAlignLeft
        xmap <unique> <ESC>kk <Plug>NERDCommenterAlignLeft
        smap <unique> <ESC>kk <C-o><Plug>NERDCommenterAlignLeft
        imap <unique> <ESC>kk <C-o><Plug>NERDCommenterAlignLeft

        " (k)omment (b)lock
        nmap <unique> <ESC>kb <Plug>NERDCommenterComment
        xmap <unique> <ESC>kb <Plug>NERDCommenterComment
        smap <unique> <ESC>kb <C-o><Plug>NERDCommenterComment

        " (ku)ncomment
        nmap <unique> <ESC>ku <Plug>NERDCommenterUncomment
        xmap <unique> <ESC>ku <Plug>NERDCommenterUncomment
        smap <unique> <ESC>ku <C-o><Plug>NERDCommenterUncomment
        imap <unique> <ESC>ku <C-o><Plug>NERDCommenterUncomment

endfunction
