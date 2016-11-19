Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0 " save space
let g:airline#extensions#tabline#fnamemod = ':p:~:.:s?.*/\([^/]*\)/\([^/]*\)?\1:\2?'
let g:airline_theme='light'
