" puts bookmarks in the gutter
Bundle 'kshenoy/vim-signature'
" use custom mappings to avoid slowing down 'd'
let g:SignatureMap = {
    \ 'Leader':             "<Leader>s",
    \ 'DeleteMark':         "<Leader>sd",
    \ 'ListLocalMarks':     "<Leader>s/",
    \ 'ListLocalMarkers':   "<Leader>s?"
    \ }
