function! esoteric#neocomplete_key#setup()

    " Up/Down Arrow keys automatically selects
    imap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
    imap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
    " Right is expand
    imap <expr><Right> pumvisible() ? "\<Plug>(neosnippet_expand)" : "\<Right>"
    " Left is cancel
    imap <expr><Left> pumvisible() ? "\<C-e>" : "\<Left>"

    " C-SPACE toggles autocomplete
    inoremap <expr><C-SPACE>  PumToggle()
    nmap <C-SPACE> i<C-SPACE>
    vmap <C-SPACE> c<C-SPACE>

    " CR to expand if pumvisible
    imap <expr><CR> pumvisible() ? "\<Plug>(neosnippet_expand)" : "\<CR>"

    " Tab will  expand or jump
    let g:tab_jumps_snippets = 1 "smap for TAB: see esoteric/plugin/tab_indent.vim
    " SuperTab like snippets behavior.
    imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


endfunction
