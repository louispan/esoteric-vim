Plugin 'scrooloose/syntastic'
" When results from multiple checkers are aggregated in a single error list
" (that is either when |syntastic_aggregate_errors| is enabled, or when checking
" a file with a composite filetype), it might not be immediately obvious which
" checker has produced a given error message. This variable instructs syntastic
" to label error messages with the names of the checkers that created them. >
let g:syntastic_id_checkers = 1

" Use this option to tell syntastic whether to use syntax highlighting to mark
" errors (where possible).
let g:syntastic_enable_highlighting = 1

" When set to 1 the error window will be automatically opened when errors are
" detected, and closed when none are detected. >
" auto open is annoying when using buffers for browsing
" let g:syntastic_auto_loc_list = o

" Enable this option to tell syntastic to always stick any detected errors into
" the |location-list|: >
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_aggregate_errors = 1
" don't check on quit |:wq|, |:x|, and |:ZZ|
let g:syntastic_check_on_wq = 1
" This make opening files slow in yesod + hdevtools
" let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1

" Syntastic haskell {
  " haskell tools
  " WARN: Bad args will silently fail. hdevtools returns 0 even if the input args are incorrect, so that syntastic think everthing is ok.
  " Don't turn on verbose or warnings for normal hdevtools info/type commands
  " NB. '-g -package Cabal -g -package filepath' is for Setup.hs. Warnings not required for hdevtools inspection mode
  let g:hdevtools_options = '' " '-g -package Cabal -g -package filepath'
  let g:ghcmod_ghc_options = [] "[ '-package Cabal', '-package filepath' ]

  " ignore ghcmod for checking (replace by the faster hdevtools,
  " until ghc-modi is supported in vim-ghc-mod
  let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']

  " https://downloads.haskell.org/~ghc/7.10.2/docs/html/users_guide/options-sanity.html
  let g:syntax_ghc_options_base =
    \['-Wall'
    \,'-fwarn-incomplete-uni-patterns'
    \,'-fwarn-incomplete-record-updates'
    \,'-fwarn-monomorphism-restriction'
    \,'-fwarn-auto-orphans'
    \,'-fwarn-identities']
    " \,'-fwarn-implicit-prelude'
    " The following disables warnings about top level bindings
    " \,'-fwarn-missing-exported-sigs'
    " Noisy warnings
    " \,'-fwarn-missing-import-lists'
  let g:syntax_ghc_options_warnings_normal = []
  let g:syntax_ghc_options_warnings_extra =
    \['-fwarn-missing-local-sigs']
  let g:syntax_ghc_options_warnings_quiet =
    \['-fno-warn-unused-imports'
    \,'-fno-warn-unused-binds'
    \,'-fno-warn-unused-matches'
    \,'-fno-warn-warnings-deprecations']
  " let g:syntastic_haskell_hdevtools_exec = "stack hdevtools"
  " let g:syntastic_haskell_hlint_exec = "stack hlint"
  " let g:syntastic_haskell_ghc_mod_exec = "stack ghc-mod"

  function! EsotericToggleSyntaxExtraWarnings(verbose)
    if !exists('g:syntax_warnings_mode') || g:syntax_warnings_mode == "quiet"
      let syntax_ghc_options = g:syntax_ghc_options_base + g:syntax_ghc_options_warnings_normal
      let g:syntax_warnings_mode = "normal"
     elseif g:syntax_warnings_mode == "normal"
      let syntax_ghc_options = g:syntax_ghc_options_base + g:syntax_ghc_options_warnings_extra
      let g:syntax_warnings_mode = "extra"
     elseif g:syntax_warnings_mode == "extra"
      let syntax_ghc_options = g:syntax_ghc_options_base + g:syntax_ghc_options_warnings_quiet
      let g:syntax_warnings_mode = "quiet"
    endif
    let syntax_hdevtools_options = []
    for option in syntax_ghc_options
      let syntax_hdevtools_options += ['-g']
      let syntax_hdevtools_options += [option]
    endfor
    let g:syntastic_haskell_hdevtools_args = join(syntax_hdevtools_options, ' ')
    let g:syntastic_haskell_ghc_mod_args = join(syntax_ghc_options, ' ')
    if a:verbose == 1
      echo 'Syntastic: ' . g:syntax_warnings_mode . ' warnings'
    endif
  endfunction
  call EsotericToggleSyntaxExtraWarnings(0)
" }

" Syntastic C++
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++ -I/opt/local/include'