" echo the current absolute filename
function! esoteric#path#working_file()
    echo expand('%:p:~')
endfunction
