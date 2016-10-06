function! esoteric#enter_key#setup()
  " enter starts insert mode
  noremap  <CR> i<CR>
  " C-Enter enters insert mode by create a new indented line after the cursor.
  noremap  <C-CR> o
  " or before the cursor.
  noremap  <S-CR> O

  imap  <S-CR> <C-o><S-CR>
  imap  <C-CR> <C-o><C-CR>

  " avoid <CR> remap problems in history and quickfix windows
  " http://stackoverflow.com/questions/16359878/vim-how-to-map-shift-enter
  augroup enter_key
      autocmd CmdwinEnter * nnoremap <CR> <CR>
      autocmd BufReadPost quickfix nnoremap <CR> <CR>
  augroup END

endfunction
