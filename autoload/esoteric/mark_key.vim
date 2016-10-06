function! esoteric#mark_key#setup()
    let g:mwDefaultHighlightingPalette = 'extended'
    call esoteric#esc_key#mapping('h')

    map <unique> <ESC>hh <Plug>MarkSet
    " No default mapping for <Plug>MarkIWhiteSet.
    map <unique> <ESC>h/ <Plug>MarkRegex
    map <unique> <ESC>hc :<C-u>nohl<CR><Plug>MarkClear<Plug>MarkAllClear
    " No default mapping for <Plug>MarkConfirmAllClear.
    map <unique> <ESC>ht <Plug>MarkToggle
    " My custom function to move to next/prev groups
    map <unique> <ESC>h8 <Plug>MarkSearchNextGroup
    map <unique> <ESC>h3 <Plug>MarkSearchPrevGroup

    map <unique> <ESC>= <Plug>MarkSearchAnyNext
    map <unique> <ESC>+ <Plug>MarkSearchAnyPrev
    map <unique> <ESC>- <Plug>MarkSearchCurrentNext
    map <unique> <ESC>_ <Plug>MarkSearchCurrentPrev
    map <unique> * <Plug>MarkSearchOrCurNext
    map <unique> # <Plug>MarkSearchOrCurPrev

    "nmap <unique> * <Plug>MarkSearchNext
    "nmap <unique> # <Plug>MarkSearchPrev
    " No default mapping for <Plug>MarkSearchOrCurNext
    " No default mapping for <Plug>MarkSearchOrCurPrev
    " No default mapping for <Plug>MarkSearchOrAnyNext
    " No default mapping for <Plug>MarkSearchOrAnyPrev
    " No default mapping for <Plug>MarkSearchGroupNext
    " No default mapping for <Plug>MarkSearchGroupPrev
    function! s:MakeMarkGroupMappings()
        for [l:cnt, l:sym] in [[1, '!'], [2, '@'], [3, '#'], [4, '$'], [5, '%'], [6, '^'], [7, '&'], [8, '*'], [9, '('], [0, ')']]
            for [l:isBackward, l:direction] in [[0, 'Next'], [1, 'Prev']]
                let l:plugMappingName = printf('<Plug>MarkSearchGroup%d%s', l:cnt, l:direction)
                execute printf('noremap <silent> %s :<C-u>call mark#SearchGroupMark(%d, v:count1, %d, 1)<CR>', l:plugMappingName, l:cnt, l:isBackward)
                if ! hasmapto(l:plugMappingName, 'n')
                    execute printf('map <ESC>%s %s', (l:isBackward == 0 ? l:cnt : l:sym), l:plugMappingName)
                endif
            endfor
        endfor
    endfunction
    call s:MakeMarkGroupMappings()
    delfunction s:MakeMarkGroupMappings

endfunction
