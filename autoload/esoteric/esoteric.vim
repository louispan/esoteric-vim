function! esoteric#esoteric#setup()

    " Settings
    call esoteric#tweaks#setup()
    call esoteric#indent#setup()
    call esoteric#vim#setup()
    call esoteric#saveplace#setup()
    call esoteric#tags#setup()

    " Keys
    call esoteric#clipboard_key#setup()
    call esoteric#undo_key#setup()
    call esoteric#erase_key#setup()
    call esoteric#save_key#setup()
    call esoteric#quit_key#setup()
    call esoteric#motion_key#setup()
    call esoteric#space_key#setup()
    call esoteric#enter_key#setup()
    call esoteric#indent_key#setup()
    call esoteric#toggle_key#setup()

    " Plugin keys
    call esoteric#easymotion_key#setup()
    call esoteric#neocomplete_key#setup()
    call esoteric#commenter_key#setup()
    call esoteric#syntastic_key#setup()
    call esoteric#haskell_key#setup()
    call esoteric#unite#setup()
    call esoteric#unite_key#setup()
    call esoteric#mark_key#setup()
    call esoteric#signature_key#setup()
    call esoteric#togglelist_key#setup()

endfunction
