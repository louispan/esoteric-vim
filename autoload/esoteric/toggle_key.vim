function! esoteric#toggle_key#setup()

" Behavior-altering option toggles
call esoteric#mappings#toggle('<F12>', 'paste')
set pastetoggle=<F12>

endfunction
