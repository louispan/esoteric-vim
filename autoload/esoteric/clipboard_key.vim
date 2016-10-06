function! esoteric#clipboard_key#setup()
    if !exists('g:esoteric#clipboard#unamed#removal') || g:esoteric#clipboard#unamed#removal != 0
      set clipboard-=unnamed
      set clipboard-=unnamedplus
    endif

    nmap       <silent> <Plug>EsotericClipboardCopy       yy:call esoteric#clipboard#yank('"')<CR>
    vmap       <silent> <Plug>EsotericClipboardCopy       y:call esoteric#clipboard#yank('"')<CR>gv

    nmap <expr><silent> <Plug>EsotericClipboardCut        esoteric#clipboard#cut_line_expr()
    vmap <expr><silent> <Plug>EsotericClipboardCut        esoteric#clipboard#cut_selection_expr()

    nmap <expr><silent> <Plug>EsotericClipboardPasteAbove esoteric#clipboard#paste_line_above_expr()
    vmap <expr><silent> <Plug>EsotericClipboardPasteAbove esoteric#clipboard#paste_selection_above_expr()

    nmap <expr><silent> <Plug>EsotericClipboardPasteBelow esoteric#clipboard#paste_line_above_expr()
    vmap <expr><silent> <Plug>EsotericClipboardPasteBelow esoteric#clipboard#paste_selection_above_expr()

    " can't be silent for commandline
    cmap                <Plug>EsotericClipboardPaste      <C-r>=esoteric#clipboard#paste_cmdline_expr()<CR>

    nmap <silent> <C-c> <Plug>EsotericClipboardCopy
    vmap <silent> <C-c> <Plug>EsotericClipboardCopy
    imap <silent> <C-c> <C-o>yy<C-o>:call esoteric#clipboard#yank('"')<CR>
    cnoremap <silent> <C-c> <C-f>yy<C-c><Down>

    nmap <silent> <C-x> <Plug>EsotericClipboardCut
    vmap <silent> <C-x> <Plug>EsotericClipboardCut
    imap <silent> <C-x> <C-o><C-x>
    nmap <silent> <C-v> <Plug>EsotericClipboardPasteAbove
    vmap <silent> <C-v> <Plug>EsotericClipboardPasteAbove
    imap <silent> <C-v> <C-o><Plug>EsotericClipboardPasteAbove
    cmap          <C-v> <Plug>EsotericClipboardPaste

    " <C-v> used to be quoted insert, so bind it to something else
    inoremap        <ESC>v <C-v>
    cnoremap        <ESC>v <C-v>
endfunction
