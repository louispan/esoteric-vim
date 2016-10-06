" http://vim.wikia.com/wiki/Quick_generic_option_toggling

" function! esoteric#mappings#make_plug_excommand(command)
"     execute printf('map  <unique><silent> <Plug>%s :<C-u>%s<CR>', a:key, a:key)
"     execute printf('imap <unique><silent> <Plug>%s :<C-o><Plug>%s<CR>', a:key)
" endfunction

function! esoteric#mappings#toggle(key, opt)
  let cmd = ':<C-u>setlocal ' . a:opt . '! \| setlocal ' . a:opt . "?\<CR>"
  exec 'nnoremap ' . a:key . ' ' . cmd
  exec 'inoremap ' . a:key . ' <C-O>' . cmd
endfunction

