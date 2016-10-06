Plugin 'louispan/vim-hdevtools', {'name': 'hdevtools'}
" hdevtools syntax checking
autocmd! FileType haskell,puppet,ruby,yml
augroup estoeric_hdevtools
    autocmd BufNewFile,BufRead *.config set filetype=cabal
    autocmd FileType lhaskell setlocal syntax=haskell

    " Everything except space and tab is a keyword in haskell
    " Also ignore parenthesis, bracket, quotes (strings), fullstop and comma
    autocmd FileType haskell,lhaskell setlocal iskeyword=33-255,^[,^],^(,^),^\,,^`,^\",^.
    " Put shared library tags in these directories to be picked in all haskell code
    " TOOD: remove this in favor of codex once codex has stack integration
    autocmd FileType haskell,lhaskell setlocal tags+=~/src/haskell/custom/**/tags
    autocmd FileType haskell,lhaskell setlocal tags+=~/src/haskell/packages/**/tags
    " NB . means from current file (else from cwd), ; means search upwards
    autocmd FileType haskell,lhaskell setlocal tags+=./codex.tags;,codex.tags;
augroup END