" manage system register explicitly, so it doesn't get trashed by yank and delete
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    let g:esoteric#clipboard#register='+'
  elseif !empty($SSH_TTY) && !has('xterm_clipboard')
    if !exists('g:esoteric#clipboard#disable_xterm_warning') || g:esoteric#clipboard#disable_xterm_warning != 0
        echoh WarningMsg | echo 'This remote version of vim is missing the xterm-clipboard feature' | echoh None
    endif
    " fallback to using 'x' register
    let g:esoteric#clipboard#register='x'
  else " On local mac and windows, use * register for copy-paste
    let g:esoteric#clipboard#register='*'
  endif
endif

function! esoteric#clipboard#yank(from)
  exec 'let @' . g:esoteric#clipboard#register . '=@' . a:from
endfunction
command! -nargs=+ ClipboardYank call esoteric#clipboard#yank(<f-args>)

function! esoteric#clipboard#put(to)
  exec 'let @' . a:to . '=@' . g:esoteric#clipboard#register
endfunction
command! -nargs=+ ClipboardPut call esoteric#clipboard#put(<f-args>)

function! esoteric#clipboard#copy(from, to)
    exec "let @" . a:to . "=@" . a:from
endfunction
command! -nargs=+ RegisterCopy call esoteric#clipboard#copy(<f-args>)

" copy
" for nmap mapping
function! esoteric#clipboard#copy_line()
  normal! yy
  call esoteric#clipboard#yank('"')
endfunction

" cut
" for nmap <expr> mapping
function! esoteric#clipboard#cut_line_expr()
  return '"' . g:esoteric#clipboard#register . 'dd'
endfunction

" for vmap <expr> mapping
function! esoteric#clipboard#cut_selection_expr()
  return '"' . g:esoteric#clipboard#register . 'd'
endfunction

" paste above
" for nmap <expr> mapping
function! esoteric#clipboard#paste_line_above_expr()
  return '"' . g:esoteric#clipboard#register . 'gP'
endfunction

" for vmap <expr> mapping
function! esoteric#clipboard#paste_selection_above_expr()
  return 'd"' . g:esoteric#clipboard#register . 'gP'
endfunction

" paste below
" for nmap <expr> mapping
function! esoteric#clipboard#paste_line_below_expr()
  return '"' . g:esoteric#clipboard#register . 'gp'
endfunction

" for vmap <expr> mapping
function! esoteric#clipboard#paste_selection_below_expr()
  return 'd"' . g:esoteric#clipboard#register . 'gp'
endfunction

" for cmap <expr> mapping
function! esoteric#clipboard#paste_cmdline_expr()
  execute 'let text=@' . g:esoteric#clipboard#register
  return text
endfunction
