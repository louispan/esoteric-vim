function! esoteric#execute#visual(command)
    normal! gv
    execute a:command
endfunction

function! esoteric#execute#count(command)
    for l:i in range(1, v:count1)
        execute a:command
    endfor
endfunction

