" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session

function! esoteric#saveplace#restore_place()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

function! esoteric#saveplace#setup()
    augroup esoteric_saveplace
        autocmd!
        autocmd BufWinEnter * call esoteric#saveplace#restore_place()
    augroup END
endfunction