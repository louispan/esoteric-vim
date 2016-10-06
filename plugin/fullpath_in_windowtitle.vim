if exists('g:loaded_esoteric_fullpath_in_windowtitle')
  finish
endif
let        g:loaded_esoteric_fullpath_in_windowtitle = 1

augroup esoteric_fullpath_in_windowtitle
    " This prints the full filepath to the terminal window
    autocmd BufEnter * silent exec '!echo "\033]0;' . expand('%:p') . '\007"' | redraw!
augroup END


