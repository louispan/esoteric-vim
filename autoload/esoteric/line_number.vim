" toggles between relative number, line number, or nonumber
" Vim 7.3 has the following behaviour
" set norelativenumber -> also sets nonumber
" set nonumber -> also sets norelativenumber
" set number -> also sets norelativenumber
" set relativenumber -> also sets nonumber
" Vim 7.4 has a hybrid mode

function! esoteric#line_number#toggle()
    if &relativenumber
        setlocal norelativenumber
        setlocal number
        echo "number"
    elseif &number
        setlocal nonumber
        echo "nonumber"
    else
        setlocal number
        setlocal relativenumber
        echo "relativenumber"
    endif
endfunction

