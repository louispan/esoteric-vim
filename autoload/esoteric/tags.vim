function! esoteric#tags#setup()
  " NB . means from current file (else from cwd), ; means search upwards
  set tags+=~/tags;
  set tags+=./tags;,tags;
  set tags+=./.git/tags;,.git/tags;
  set tags+=./.tags/**/tags;,.tags/**/tags

endfunction
