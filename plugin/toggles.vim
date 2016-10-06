if exists('g:loaded_esoteric_toggles')
  finish
endif
let        g:loaded_esoteric_toggles = 1

command! EsotericLineNumberToggle call esoteric#line_number#toggle()
