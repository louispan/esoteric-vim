function! esoteric#haskell_key#setup()
    augroup estoeric_hdevtools
        autocmd BufNewFile,BufRead *.config set filetype=cabal
        autocmd FileType lhaskell setlocal syntax=haskell

        autocmd FileType haskell,lhaskell,cabal setlocal expandtab shiftwidth=2 softtabstop=2
        autocmd FileType haskell,lhaskell nnoremap <buffer> <F2> :call hdevtools#type_clear()<CR>:GhcModTypeClear<CR>:HoogleClose<CR>:echo 'Cleared inspection highlights'<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <C-F2> :silent exec '!killall hdevtools' <BAR> redraw!<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <F3> :let @h=hdevtools#type()[1]<BAR>echom @h<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <C-F3> :GhcModType<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <M-F3> :call HoogleLookup(expand('<cword>'), '')<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <F4> :call hdevtools#info('')<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <C-F4> :GhcModInfoPreview<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <M-F4> :call HoogleLookup(expand('<cword>'), ' --info')<CR>
        autocmd FileType haskell,lhaskell nnoremap <buffer> <C-F5> :GhcModExpand<CR>
    augroup END
endfunction