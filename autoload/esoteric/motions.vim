" This function is only required in normal and visual mode.
" In normal and visual mode, even with whichwrap turned on for left,
" left at the beginning of the line doesn't got the end of the previous line,
" but to the char before the end of the line.
function! esoteric#motions#wrapping_left()
    let [l:bufnum, l:lnum, l:col, l:off] = getpos(".")

    if l:col == 1
        call searchpos('$', 'Wb')
    else
        call setpos('.', [l:bufnum, l:lnum, l:col - 1, l:off])
    endif
endfunction

" This function is only required in normal mode.
" In normal mode, <End> doesn't got the end of the line,
" but to the char before the end of the line.
function! esoteric#motions#smart_end()
   call searchpos('$', '', line('.'))
endfunction

" Only when at the start of a line, vim doesn't want to d{motion} to the previous end-of-line.
" So hack around it by detecting it here
function! esoteric#motions#wrapping_backspace_word()
    if col(".") == 1
        let l:saved_which_wrap = &whichwrap
        set whichwrap+=b
        execute "normal \<BS>"
        let &whichwrap = l:saved_which_wrap
    else
        if g:loaded_camelcasemotion == 1
            silent execute "normal! d:\<C-u>call camelcasemotion#Motion('b', 1, 'n')\<CR>"
        else
            normal db
        endif
    endif
endfunction

