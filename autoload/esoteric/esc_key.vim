function! esoteric#esc_key#mapping(key)
    " allows ESC for 2nd letter of mapping for usability
    execute printf('nmap  <unique><silent> <ESC>%s<ESC> <ESC>%s', a:key, a:key)
    execute printf('xmap  <unique><silent> <ESC>%s<ESC> <ESC>%s', a:key, a:key)
    execute printf('smap  <unique><silent> <ESC>%s<ESC> <ESC>%s', a:key, a:key)
    execute printf('map! <unique><silent> <ESC>%s<ESC> <ESC>%s', a:key, a:key)
endfunction
