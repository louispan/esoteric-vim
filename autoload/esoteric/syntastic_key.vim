function! esoteric#syntastic_key#setup()
    nnoremap <Plug>EsotericToggleSyntaxExtraWarnings :<C-u>call EsotericToggleSyntaxExtraWarnings(1)<CR>
    nmap <C-F10> <Plug>EsotericToggleSyntaxExtraWarnings
    nmap <F10> :<C-u>call SyntasticToggleMode()<CR>
endfunction
