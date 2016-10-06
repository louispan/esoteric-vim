function! esoteric#motion_key#setup()
    " In normal mode, even with whichwrap, left doens't go to previous eol
    " emulate keymodel=stopkey, no shift doesn't maintain visual mode
    noremap <silent> <Left> :<C-U>EsotericExecuteCount ":call esoteric#motions#wrapping_left()"<CR>
    "xnoremap <silent> <Left> :<C-U>EsotericExecuteVisual ':EsotericExecuteCount ":call esoteric#motions#wrapping_left()"'<CR>

    " maintain visual mode when shifted
    xnoremap <silent> <S-Left> :<C-U>EsotericExecuteVisual ':EsotericExecuteCount ":call esoteric#motions#wrapping_left()"'<CR>

    " setup shift selection
    set keymodel+=startsel
    set keymodel+=stopsel

    " in normal mode, end doesn't go to end of line, but the character before
    map <silent> <End> :call esoteric#motions#smart_end()<CR>

    " home toggles between bol and indent
    noremap  <silent> <Home> :<C-U>SmartHomeKey<CR>
    vnoremap <silent> <Home> :<C-U>EsotericExecuteVisual ":SmartHomeKey"<CR>
    inoremap <silent> <Home> <C-o>:SmartHomeKey<CR>

    " ctrl moves to front/end of line
    map  <silent> <C-Left> <Home>
    map! <silent> <C-Left> <Home>
    cnoremap <silent> <C-Left> <Home>

    map  <silent> <C-Right> <End>
    map! <silent> <C-Right> <End>
    cnoremap <silent> <C-Right> <End>

    map  <silent> <C-S-Left> <S-Home>
    map! <silent> <C-S-Left> <S-Home>
    cnoremap <silent> <C-S-Left> <Home>

    map  <silent> <C-S-Right> <S-End>
    map! <silent> <C-S-Right> <S-End>
    cnoremap <silent> <C-S-Right> <End>

    " ctrl moves by pages
    map  <silent> <C-Up>     <PageUp>
    map! <silent> <C-Up>     <PageUp>
    map  <silent> <C-Down>   <PageDown>
    map! <silent> <C-Down>   <PageDown>
    map  <silent> <C-S-Up>   <S-PageUp>
    map! <silent> <C-S-Up>   <S-PageUp>
    map  <silent> <C-S-Down> <S-PageDown>
    map! <silent> <C-S-Down> <S-PageDown>

    " alt moves by words
    nmap <silent> <M-Left> :<C-U>call camelcasemotion#Motion('b', 1, 'n')<CR>
    omap <silent> <M-Left> :<C-U>call camelcasemotion#Motion('b', 1, 'o')<CR>
    " emulate keymode=stopkey. The below does not maintain visual mode
    xmap <silent> <M-Left> :<C-U>call camelcasemotion#Motion('b', 1, 'n')<CR>
    imap <silent> <M-Left> <C-O>:<C-U>call camelcasemotion#Motion('b', 1, 'o')<CR>
    cnoremap <M-Left> <S-Left>

    nmap <silent> <M-Right> :<C-U>call camelcasemotion#Motion('e', 1, 'n')<CR>
    omap <silent> <M-Right> :<C-U>call camelcasemotion#Motion('e', 1, 'o')<CR>
    " emulate keymode=stopkey. The below does not maintain visual mode
    " <ESC> out of visual mode because using :call will move cursor to to
    " front of visual section, because vim.
    xmap <silent> <M-Right> <Esc>:<C-U>call camelcasemotion#Motion('e', 1, 'n')<CR>
    imap <silent> <M-Right> <C-O>:<C-U>call camelcasemotion#Motion('e', 1, 'o')<CR>
    cnoremap <M-Right> <S-Right>

    " camelcase rules weird (remove one char symbol special rule)

    " emulate keymode=selkey,stopkey
    nmap <silent> <M-S-Left> v:<C-U>call camelcasemotion#Motion('b', 1, 'v')<CR>
    xmap <silent> <M-S-Left> :<C-U>call camelcasemotion#Motion('b', 1, 'v')<CR>

    nmap <silent> <M-S-Right> v:<C-U>call camelcasemotion#Motion('e', 1, 'v')<CR>
    xmap <silent> <M-S-Right> :<C-U>call camelcasemotion#Motion('e', 1, 'v')<CR>

    " jump up/down paragraphs easily
    noremap <M-Up>     {
    imap    <M-Up>     <C-O><M-Up>

    noremap <M-Down>   }
    imap    <M-Down>   <C-O><M-Down>

    " shift-selecting
    noremap <S-M-Up>   v{
    noremap <S-M-Down> v}

    vmap    <M-Up>     <C-c><M-Up>
    vmap    <M-Down>   <C-c><M-Down>
    vmap    <S-M-Up>   {
    vmap    <S-M-Down> }

    " PageUp/PageDown
    " Sets scroll to 0 (half height), *2, -1, scroll, reset
    "nnoremap <silent> <PageDown> :EsotericExecuteCount ":JumpPage 1"<CR>
    "nnoremap <silent> <PageUp> :EsotericExecuteCount ":JumpPage 0"<CR>
    "imap <silent> <PageUp> <C-c><PageUp>i
    "imap <silent> <PageDown> <C-c><PageDown>i
    " visual mode ":normal gv" recenters, so call EsotericExecuteVisual from normal mode
    "vnoremap <silent> <PageDown> <C-c>:EsotericExecuteVisual ":EsotericExecuteCount ':JumpPage 1'"<CR>
    "vnoremap <silent> <PageUp> <C-c>:EsotericExecuteVisual ":EsotericExecuteCount ':JumpPage 0'"<CR>

    nmap  <PageUp> <C-u>
    nmap  <PageDown> <C-d>

    " shift-selecting
    nmap  <S-PageUp> v<C-u>
    nmap  <S-PageDown> v<C-d>

    vmap  <PageUp> <C-c><PageUp>
    vmap  <PageDown> <C-c><PageDown>
    vmap  <S-PageUp> <C-u>
    vmap  <S-PageDown> <C-d>

endfunction
