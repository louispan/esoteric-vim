function! esoteric#easymotion_key#setup()
  let g:EasyMotion_leader_key = ';'
  map ; <Plug>(easymotion-prefix)
  " Jump to anywhere Default: Beginning and End of word, Camelcase, after '_', and after '#'.
  map <Plug>(easymotion-prefix)a <Plug>(easymotion-jumptoanywhere)
  " map <Plug>(easymotion-prefix); <Plug>(easymotion-sn)
  map <Plug>(easymotion-prefix); <Plug>(easymotion-s)
  map <Plug>(easymotion-prefix)w <Plug>(easymotion-bd-w)
  map <Plug>(easymotion-prefix)W <Plug>(easymotion-bd-W)
  map <Plug>(easymotion-prefix)b <Plug>(easymotion-bd-w)
  map <Plug>(easymotion-prefix)B <Plug>(easymotion-bd-W)
  map <Plug>(easymotion-prefix)e <Plug>(easymotion-bd-e)
  map <Plug>(easymotion-prefix)E <Plug>(easymotion-bd-E)
  map <Plug>(easymotion-prefix)ge <Plug>(easymotion-bd-e)
  map <Plug>(easymotion-prefix)gE <Plug>(easymotion-bd-E)
  map <Plug>(easymotion-prefix)k <Plug>(easymotion-bd-jk)
  map <Plug>(easymotion-prefix)j <Plug>(easymotion-bd-jk)
  map <Plug>(easymotion-prefix)/ <Plug>(easymotion-bd-n)
  map <Plug>(easymotion-prefix)? <Plug>(easymotion-bd-n)

endfunction
