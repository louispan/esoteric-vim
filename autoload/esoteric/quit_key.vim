function! esoteric#quit_key#setup()

    map <silent> <C-q> :call esoteric#quit#quit()<CR>
    noremap! <silent> <C-q> <C-c>:call esoteric#quit#quit()<CR>

    " I want to use Ctrl-C to be copy like modern IDEs
    " So make Alt-c cancel instead
    noremap <silent> <ESC>c :call esoteric#quit#cancel()<CR>
    noremap! <ESC>c <C-c>

    if exists('g:enable_neocomplete') && g:enable_neocomplete != 0
        inoremap <silent><expr> <ESC>c neocomplete#cancel_popup() . "\<C-c>`^"
    else
        inoremap <silent><expr> <ESC>c (pumvisible() ? "\<C-e>" : "") . "\<C-c>`^"
    endif

endfunction
