Plugin 'Shougo/neocomplete.vim'

let g:enable_neocomplete = 1
let g:neocomplete#disable_auto_complete = 1 " use C-SPACE to manually toggle
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1

" C-SPACE toggles autocomplete
function! PumToggle()
  if pumvisible()
    return "\<C-e>"
  else
    return neocomplete#start_manual_complete()
  endif
endfunction