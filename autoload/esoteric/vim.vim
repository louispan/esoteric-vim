function! esoteric#vim#setup()

  augroup vim_setup
    " better word detection for vim
    autocmd FileType vim setlocal iskeyword+=#,:,-
  augroup END

endfunction
