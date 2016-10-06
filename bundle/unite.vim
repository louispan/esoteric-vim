Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'louispan/unite-session'
Plugin 'tacroe/unite-mark'
Plugin 'thinca/vim-unite-history'

if executable('ag') && executable('cag.bash')
    "NB. cag.bash has --follow already"
    let g:unite_source_rec_async_command =
        \ ['cag.bash', '-l', '--nocolor', '--nogroup', '--hidden', '-g', '']
elseif executable('cfindf.bash')
    let g:unite_source_rec_async_command = ["cfindf.bash"]
endif

" (g)rep
" if executable('ag') && executable('cag.bash')
"     " Use ag in unite grep source.
"     let g:unite_source_grep_command = 'cag.bash'
"     " NB. cag contains ignore directories
"     let g:unite_source_grep_default_opts =
"         \ '-i --line-numbers --nocolor --nogroup --hidden'
"     let g:unite_source_grep_recursive_opt = ''
if executable('cgrep.bash')
    let g:unite_source_grep_command = 'cgrep.bash'
    let g:unite_source_grep_default_opts = ''
    let g:unite_source_grep_recursive_opt = ''
else
    let g:unite_source_grep_recursive_opt = '-R'
endif

Plugin 'tsukkee/unite-tag'
" goto_(t)ag
let g:unite_source_tag_max_name_length = 20
let g:unite_source_tag_max_fname_length = 70

" (f)ind
if executable('cfind.bash')
    let g:unite_source_find_command = 'cfind.bash'
endif

" (y)ank
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1

" Vimfilter
let g:vimfiler_as_default_explorer = 1
let g:loaded_netrwPlugin = 1
