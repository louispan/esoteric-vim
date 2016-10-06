function! esoteric#unite_key#setup()
    function! s:esoteric_unite_custom_settings()
        " restore original insert mode <C-o> mapping
        inoremap <silent><buffer> <C-o> <C-o>
        " convenience mappings
        imap <buffer> <C-BS>     <Plug>(unite_delete_backward_line)
        imap <buffer> <M-BS>     <Plug>(unite_delete_backward_word)
        " vertical split
        imap <silent><buffer><expr> <C-CR>     unite#do_action('vsplitswitch')
        map <silent><buffer><expr> <C-CR>     unite#do_action('vsplitswitch')
    endfunction

    augroup unite_custom
      autocmd FileType unite call s:esoteric_unite_custom_settings()
    augroup END

    " Unite command, like emacs M-x
    call esoteric#unite#make_basic_mappings('x', ['command'], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'e(x)ecute command'})

    " Press <C-l> to refresh
    " NB. <ESC>O interfers with arrow keys
    call esoteric#unite#make_basic_mappings('l', [['buffer','-']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(l)ist buffers'})
    call esoteric#unite#make_basic_mappings('L', [['buffer','!']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(L)ist all buffers'})

    " Can't map <ESC>O, it gets triggered by cursor keys for some reason
    call esoteric#unite#make_basic_mappings('R', [['neomru/file'], ['neomru/directory']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'm(R)u_files'})

    " (p)roject (git) files
    " nnoremap <ESC>p :<C-u>UniteClose<CR>:<C-u>Unite -start-insert -buffer-name=(p)roject_files file_rec/git:--cached:--others:--exclude-standard<CR>
    " imap     <silent> <ESC>p  <C-o><ESC>p
    call esoteric#unite#make_default_dir_mappings('p', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'buffer_(p)roject_files'}, 0, '?!')
    call esoteric#unite#make_default_dir_mappings('P', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'cwd_(P)roject_files'}, 0, '!')
    call esoteric#unite#make_default_dir_mappings('t', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'curren(t)_buffer_directory_files'}, 0, '?')
    call esoteric#unite#make_default_dir_mappings('T', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'curren(T)_cwd_directory_files'}, 0, '.')
    call esoteric#unite#make_default_dir_mappings('d', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'default_buffer_project_(d)irectory_files'}, 1, '?!')
    call esoteric#unite#make_default_dir_mappings('D', [['file_rec/async']], {'toggle': 1, 'start_insert': 1, 'buffer_name': 'default_cwd_project_(D)irectory_files'}, 1, '!')

    " file (B)ookmarks (press b in unite buffer to add to bookmark list)
    call esoteric#unite#make_basic_mappings('b', ['bookmark'], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(b)ookmarks'})

    " (g)rep (k)eyword in project dir
    " I want grep to default to project dir
    " and default to cursor pattern, but allow user to change them

    " allows ESC for 2nd letter of mapping for usability
    call esoteric#esc_key#mapping('g')
    call esoteric#esc_key#mapping('G')

    " (gg)rep
    call esoteric#unite#make_default_dir_with_cursor_word_mappings('gg', [['grep']], {'start_insert': 1, 'buffer_name': '(gg)rep'}, 0, '?!', 0, 'g')
    call esoteric#unite#make_resume_mappings('GG', '(gg)rep')

    " (g)rep(#)
    for cnt in range(0, 9)
        call esoteric#unite#make_default_dir_with_cursor_word_mappings('g' . cnt, [['grep']], {'start_insert': 1, 'buffer_name': '(g)rep(' . cnt . ')'}, 1, '?!', 1, 'g')
        call esoteric#unite#make_resume_mappings('G' . cnt, '(g)rep(' . cnt . ')')
    endfor
    call esoteric#unite#make_resume_mappings('G!', '(g)rep(1)')
    call esoteric#unite#make_resume_mappings('G@', '(g)rep(2)')
    call esoteric#unite#make_resume_mappings('G#', '(g)rep(3)')
    call esoteric#unite#make_resume_mappings('G$', '(g)rep(4)')
    call esoteric#unite#make_resume_mappings('G%', '(g)rep(5)')
    call esoteric#unite#make_resume_mappings('G^', '(g)rep(6)')
    call esoteric#unite#make_resume_mappings('G&', '(g)rep(7)')
    call esoteric#unite#make_resume_mappings('G*', '(g)rep(8)')
    call esoteric#unite#make_resume_mappings('G(', '(g)rep(9)')
    call esoteric#unite#make_resume_mappings('G)', '(g)rep(0)')

    " goto_(t)ag
    call esoteric#unite#make_default_dir_with_cursor_word_mappings(']', [['tag','tag/include']], {'start_insert': 1, 'buffer_name': '(])tags'}, 0, '', 1, 't')

    " (f)ind
    if executable('cfind.bash')
        let g:unite_source_find_command = 'cfind.bash'
    endif
    call esoteric#esc_key#mapping('f')
    call esoteric#esc_key#mapping('F')

    " (ff)ind
    call esoteric#unite#make_default_dir_with_cursor_word_mappings('ff', [['esoteric_find']], {'start_insert': 1, 'buffer_name': '(ff)ind'}, 0, '?!', 0, 'f')
    call esoteric#unite#make_resume_mappings('FF', '(ff)ind')

    " (f)find(#)
    for cnt in range(0, 9)
        call esoteric#unite#make_default_dir_with_cursor_word_mappings('f' . cnt, [['esoteric_find']], {'start_insert': 1, 'buffer_name': '(f)ind(' . cnt . ')'}, 1, '?!', 1, 'f')
        call esoteric#unite#make_resume_mappings('F' . cnt, '(f)ind(' . cnt . ')')
    endfor
    call esoteric#unite#make_resume_mappings('F!', '(f)ind(1)')
    call esoteric#unite#make_resume_mappings('F@', '(f)ind(2)')
    call esoteric#unite#make_resume_mappings('F#', '(f)ind(3)')
    call esoteric#unite#make_resume_mappings('F$', '(f)ind(4)')
    call esoteric#unite#make_resume_mappings('F%', '(f)ind(5)')
    call esoteric#unite#make_resume_mappings('F^', '(f)ind(6)')
    call esoteric#unite#make_resume_mappings('F&', '(f)ind(7)')
    call esoteric#unite#make_resume_mappings('F*', '(f)ind(8)')
    call esoteric#unite#make_resume_mappings('F(', '(f)ind(9)')
    call esoteric#unite#make_resume_mappings('F)', '(f)ind(0)')

    " (y)ank
    " Press <C-l> to refresh
    call esoteric#unite#make_basic_mappings("'", [['history/yank']], {'toggle': 1, 'buffer_name': "(')yanks"})
    call esoteric#unite#make_basic_mappings('"', [['register']], {'toggle': 1, 'buffer_name': '(")registers'})

    call esoteric#unite#make_basic_mappings('m', [['mark']], {'toggle': 1, 'no_quit': 1, 'buffer_name': '(m)arks'})
    call esoteric#unite#make_basic_mappings('j', [['jump']], {'toggle': 1, 'no_quit': 1, 'buffer_name': '(j)umps'})

    " standard vim `q:` also opens command window
    " (r)ecent commands (same as bash)
    call esoteric#unite#make_basic_mappings('r', [['history/command']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(r)ecent_commands'})
    call esoteric#unite#make_basic_mappings('?', [['history/search']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(?)searches'})

    " u(q)uit (see meta_q_quits_buffer.vim)

    " line (fuzzy search current buffer)
    call esoteric#unite#make_basic_mappings('/', [['line']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(/)lines'})

    " sessions
    call esoteric#esc_key#mapping('S')
    call esoteric#unite#make_basic_mappings('SS', [['session/new']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(S)ession(S)ave'})
    call esoteric#unite#make_basic_mappings('SL', [['session']], {'toggle': 1, 'start_insert': 1, 'buffer_name': '(S)ession(L)oad'})

    " TODO: Add useful vim mappings to unite menus to be discoverable
    function! s:esoteric_vimfiler_custom_settings()
        nmap <buffer><silent> <M-Up> <Plug>(vimfiler_jump_first_child)
        nmap <buffer><silent> <M-Down> <Plug>(vimfiler_jump_last_child)
        nmap <buffer><silent> <M-Left> <Plug>(vimfiler_smart_l)
        nmap <buffer><silent> <M-Right> <Plug>(vimfiler_smart_h)
        " map p to preview to be consistent with unite
        nmap <buffer><silent> p <Plug>(vimfiler_preview_file)
        nmap <buffer><silent> <ESC>! <Plug>(vimfiler_popup_shell)
        nmap <buffer><silent> cd <Plug>(vimfiler_cd_vim_current_dir)
        nmap <buffer><silent> r <Plug>(vimfiler_switch_to_history_directory)
        nmap <buffer><silent> b <Plug>(vimfiler_pushd)
        nmap <buffer><silent> <C-b> <Plug>(vimfiler_popd)
        nmap <buffer><silent> i :<C-u>Unite -start-insert line<CR>

        " annoying unsafe mappings
        nunmap <buffer><silent> c
        nunmap <buffer><silent> Cc
        nunmap <buffer><silent> m
        nunmap <buffer><silent> Cm
        nunmap <buffer><silent> d
        nunmap <buffer><silent> r
        nunmap <buffer><silent> K
        nunmap <buffer><silent> N
        nunmap <buffer><silent> Cp
        nunmap <buffer><silent> gv
        nunmap <buffer><silent> H
        nunmap <buffer><silent> gs
        nunmap <buffer><silent> gS
    endfunction
    autocmd FileType vimfiler call s:esoteric_vimfiler_custom_settings()

    nnoremap <unique><silent> <ESC>e :<C-u>VimFilerBufferDir -toggle -status<CR>
    imap     <unique><silent> <ESC>e <C-c><ESC>e
    nnoremap <unique><silent> <ESC>E :<C-u>VimFiler -toggle -status<CR>
    imap     <unique><silent> <ESC>E <C-c><ESC>E


endfunction