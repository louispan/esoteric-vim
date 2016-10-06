function! esoteric#indent_key#setup()

    inoremap <silent> <S-Tab> <C-o><<
    nnoremap <silent> <Tab>   >>
    vnoremap <silent> <Tab>   1>gv
    nnoremap <silent> <S-Tab> <<
    vnoremap <silent> <S-Tab> 1<gv

    if exists('g:tab_jumps_snippets') && g:tab_jumps_snippets != 0
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "1>gv\<C-g>"
    endif

    " <Tab> is <C-i> which is used in jumps so remap jump in to something else
    " <C-O> was used to switch between Hebrew and English keyboard mode
    noremap  <silent> <ESC><C-o>   <Tab>
    vnoremap <silent> <ESC><C-o>   <Tab>

endfunction
