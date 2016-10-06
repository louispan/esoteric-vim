let s:bundle_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! SourceEsotericBundle(bundle)
  let l:bundle_path = expand(s:bundle_dir . "/" . a:bundle)
  if filereadable(l:bundle_path)
      execute "source " . l:bundle_path
  endif
endfunction

Plugin 'louispan/hijackey-vim'

call SourceEsotericBundle("airline.vim")

Plugin 'bling/vim-bufferline'
Plugin 'drmikehenry/vim-fontdetect'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
call SourceEsotericBundle("signature.vim")
Plugin 'louispan/CamelCaseMotion'
Plugin 'louispan/Smart-Home-Key'
Plugin 'louispan/Mark--Karkat'
Plugin 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle=1

Plugin 'mhinz/vim-signify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'osyo-manga/vim-over'
Plugin 'tpope/vim-abolish.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/restore_view.vim'

" Macros
Plugin 'vim-scripts/marvim'
let g:marvim_find_key = '<F6>' " change find key from <F2>
let g:marvim_store_key = '<C-F6>'     " change store key from <F3>
let g:marvim_register = 'q'       " change used register from 'q'

" Programming plugins
Plugin 'Shougo/context_filetype.vim'
call SourceEsotericBundle("neocomplete.vim")
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
let g:neosnippet#enable_conceal_markers = 0
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
let g:tagbar_sort = 0 " sort tags by file order

call SourceEsotericBundle("nerdcommenter.vim")
call SourceEsotericBundle("syntastic.vim")

Plugin 'szw/vim-tags'
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} --c++-kinds=+p --fields=+iaSl --extra=+q {DIRECTORY} 2>/dev/null"

call SourceEsotericBundle("fugitive.vim")

" Location list
Plugin 'milkypostman/vim-togglelist'
let g:toggle_list_no_mappings = 1

" Python plugins
Plugin 'klen/python-mode'
Plugin 'yssource/python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'

" Haskell plugins
Plugin 'Shougo/vimproc.vim'
Plugin 'Twinside/vim-hoogle'
Plugin 'Twinside/vim-syntax-haskell-cabal'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'louispan/lushtags'
Plugin 'louispan/syntaxhaskell.vim'
let g:hs_highlight_types = 1
let g:hs_highlight_debug = 1
call SourceEsotericBundle("hdevtools.vim")
Plugin 'pbrisbin/vim-syntax-shakespeare'

" Visual
Plugin 'kergoth/vim-hilinks'
Plugin 'louispan/vim-monokai-black'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jnurmine/Zenburn'

" Unite
call SourceEsotericBundle("unite.vim")

