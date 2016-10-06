function! esoteric#signature_key#setup()
    nmap <unique> m<ESC>t :<C-u>SignatureToggleSigns<CR>
    nmap <unique> m<ESC>l :<C-u>SignatureRefresh<CR>
endfunction