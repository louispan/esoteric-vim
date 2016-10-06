if exists('g:loaded_esoteric_execute')
  finish
endif
let        g:loaded_esoteric_execute = 1

command! -nargs=1 EsotericExecuteVisual call esoteric#execute#visual(<args>)
command! -nargs=1 -count=1 EsotericExecuteCount call esoteric#execute#count(<args>)

