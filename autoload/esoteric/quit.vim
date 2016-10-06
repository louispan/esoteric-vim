function! esoteric#quit#quit()
    let current_filetype = &filetype
    if current_filetype ==? "unite"
        execute "UniteClose"
    else
        execute "q"
    endif
endfunction

function! esoteric#quit#cancel()
    let current_filetype = &filetype
    if current_filetype ==? "unite"
        execute "UniteClose"
    else
        call feedkeys("\<C-c>")
    endif
endfunction

