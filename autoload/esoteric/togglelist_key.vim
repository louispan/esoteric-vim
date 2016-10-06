function! esoteric#togglelist_key#setup()
    nmap <leader>tl :<C-u>call ToggleLocationList()<CR>
    nmap <leader>tq :<C-u>call ToggleQuickfixList()<CR>
endfunction
