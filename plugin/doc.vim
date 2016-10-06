if exists('g:loaded_esoteric_doc')
  finish
endif
let        g:loaded_esoteric_doc = 1

" Quick fix {
    " :cope[n] : open quickfix
    " :ccl[ose] : close quickfix
    " :cf[irst] : first error
    " :cl[ast] : last error
    " :cn[ext] : next error
    " :cp[rev] : prevous error
" }

" Location window {
    " :lope[n] : open quickfix
    " :lcl[ose] : close quickfix
    " :lf[irst] : first error
    " :ll[ast] : last error
    " :ln[ext] : next error
    " :lp[rev] : prevous error
" }

" vimdiff {
    " :diffupdate           refresh syntax highlighting which sometimes gets confused
    " :[range]diffget       vimdiff get change into active buffer from other buffer
    " :do                   (obtain) same as diffget, without range, for change on or just above cursor
    " :[range]diffput       vimdiff put change from active buffer to other buffer
    " :dp                   same as diffput, without range, for change on or just above cursor
    " ]c                    jump to next change
    " [c                    jump to previous change
"}
"}

" Basic vim commands {
" Help {
    " C-} : go into help topic
    " <C-g> : Echo filename, location
" }

" Commandline {
    " :pwd : Current vim working directory
    " :cd : Change vim working directory
    " :! : run command
    " :read : run command and past result in buffer
    " q: — Open with a command history from normal mode
    " q/ — Open with a search history from normal mode (to search forward)
    " q? — Open with a search history from normal mode (to search backward)
    " Ctrl+F — Open with a command history from command mode
"}

" History {
    " :jumps : history listing
    " <C-o> : go back out
    " <C-i> : go forward
    " <Tab> : go forward
    " <S-Tab> : go back out
" }

" Marks {
    " :marks : list bookmarks
    " m{char} : create a bookmark
    " '{char} : jump to soft bol of mark
    " `{char} : jump to line & column of mark
" }

" Exiting {
    " :q[!] : quit without writing [force]
    " :w[!] : write [force]
    " :x[!] : write and quit [force]
" }

" Modes {
    " v : visual mode
    " V : visual line mode
    " <C-Q> : visual block mode
    " i : insert mode
    " <ESC> : normal mode
" }

" Visual {
    " gv : reslect previous visual mode selection
" }

" Navigate {
    " :[count] : to the [count]th line
    " gg : first line
    " G : last line
    " ^ : to the first non-blank character of the line
    " 0 or <Home> : beginning of line
    " $ or <End> : end of line
    " [count]b : begin of previous word
    " [count]e : end of next word
    " [count]+ : move down lines
    " [count]- : move up lines
    " [count]{ : jump up paragraph
    " [count]} : jump down paragraph
    " [count]% : to the next block delimited by ([{}]), /* */, #if, #ifdef, #else, #elif, #endif
    " f{char} : To [count]'th occurrence of {char} to the right. The cursor is placed on {char} (inclusive).
    " F{char} : To the [count]'th occurrence of {char} to the left. The cursor is placed on {char} (inclusive).
    " ; : Repeat latest f, t, F or T [count] times.
    " , : Repeat latest f, t, F or T in opposite direction [count] times.
    " zl : scroll screen left by half a screen
    " zr : scroll screen left by half a screen
    " [count]z<Left> : screen screen left by [count] chars
    " [count]z<Right> : screen screen left by [right] chars
    " zs : scroll screen left so cursor is at the start (left) of the screen
    " ze : scroll screen right so cursor is at the end (right) of the screen
    " zz : scroll so cursor is in the middle
    " zb : scroll so cursor is on the bottom
    " zt : scroll so cursor is on the top
" }

" Text objects { " Select before and after the cursor position
    " {a or i} means 'a' or 'inner'
    " [count]{command}{a or i}w : word
    " [count]{command}{a or i}p : paragraph
    " [count]{command}{a or i}" : " quoted string
    " [count]{command}{a or i}' : ' quoted string
    " [count]{command}{a or i}` : ` quoted string
    " [count]{command}{a or i}) : ) parenthesis
    " [count]{command}{a or i}] : ] square bracket
    " [count]{command}{a or i}> : > bracket
    " [count]{command}{a or i}t : xml tag
    " CamelCaseMotion plugin
    " [count]{command}{a or i},w : camel (comma) case word motion
    " IndentObject plugin
    " [count]{command}ii : indented block
    " [count]{command}ai : above line + indented block
    " [count]{command}aI : above line + indented block + below line
" }

" Inserting from Normal mode {
    " a or A : append (to end of line)
    " i or I : insert (to beginning of line)
    " o or O : insert new line (before/after this line)
    " <C-c>i : <C-g>u : break undo sequence, start new change
" }

" UndoTree {
    " ,u : Toggle UndoTree, S indicates current saved state
    " [count]u : undo [count] changes
    " [count]C-R : redo [count] changes
" }

" Registers {
    " ["x]y{motion} : Yank {motion} text [into register x]
    " [count]["x]yy : Yank [count]line [into register x]
    " {Visual}["x]y : Yank the highlighted text [into register x]
    " {Visual}["x]Y : Yank the highlighted lines [into register x]
    " ["x]p : put text after cursor [from register x]
    " ["x]P : put text before cursor [from register x]
    " ["x]gp : Just like "p", but leave the cursor just after the new text
    " ["x]gP : Just like "P", but leave the cursor just after the new text.
    " ["x]<MiddleMouse> : put text before cursor [from register x]
    " ["x][p : ["x]]p : Just like "p", but adjust the indent to the current line.
    " ["x][P : ["x]]P : Just like "P", but adjust the indent to the current line.
    " ["x][<MiddleMouse> : ["x]]<MiddleMouse> : paste and adjust the indent to the current line.
    " [count]["x]x : forward <del>, ie delete [count] chars after cursor [into register x]
    " [count]["x]X : <bs>, ie delete [count] chars before and at cursor [into register x]
    " [count]["x]d{motion} : delete [count] line [into register x]
    " [count]["x]dd : delete [count] line [into register x]
    " {Visual}["x]x : {Visual}["x]d : {Visual}["x]<Del> : delete highlighted text [into register x]
    " {Visual}["x]X : {Visual}["x]D : delete highlighted lines [into register x]
    " "+ : * : system register. works via xterm too. Set to the default with :set clipboard = unnamedplus (see spf13 .vimrc)`
    " :reg : list current registers
" }

" Range {
    " {number} : absolute linenumber
    " $ : last line     :$s/old/new/g
    " . : current line
    " % : all lines (same as 1,$)     :%s/old/new/g
    " 21,25 : lines 21 to 25 inclusive    :21,25s/old/new/g
    " .,.+5 : six lines (current to current+5 inclusive)  :.,.+5s/old/new/g
    " .,.5 : same (.5 is interpreted as .+5)     :.,.5s/old/new/g
" }

" Pattern {
    " set ignorecase; set smartcase : lower case pattern means ignorecase
    " \c{pattern} : force ignorecase for the pattern
    " \C{pattern} : force case matching for the pattern
    " $ : end of line
    " . : any char
    " | : or
    " \(\) : grouping
" }

" Searching {
    " :noh : temporarily turn off search highlight.
    " * : search forward for word under cursor
    " # : search backwards for word under cursor
    " [count]/{pattern} : search forwards for the [count]'th occurrence of {pattern}
    " [count]/ : search forwards for the [count]'th occurrence of last used pattern
    " [count]n : (doesn't need enter) search forwards for the [count]'th occurrence of last used pattern
    " [count]?{pattern} : search backwards for the [count]'th occurrence of {pattern}
    " [count]? : search backwards for the [count]'th occurrence of last used pattern
    " [count]N : (doesn't need enter) search backwards for the [count]'th occurrence of last used pattern
" }

" Replace {
    " ~ : switch case of char under cursor
    " :[range]s/{pattern}/{string}/[flags] [count]   For each line in [range] replace a match of {pattern} with {string}.
    " :[range]s [flags] [count]
    " :[range]&[flags] [count]     Repeat last :substitute with same search pattern and substitute string, but without the same flags. You may add extra flags
    " flags
        " & : reuse last substitution flags
        " c : confirm each substitution
        " g : replace all occurrence in the line (not just the first occurence)
        " i : ignore case for pattern
        " I : don't ignore case for pattern
        " p : print the last substitution
        " # : print the last substitution with line number

    " :OverCommandLine : Shows preview of substituion. Use %s/pattern/replace/g for substitution.
" }

" Buffers {
    " :ls  : List buffers
    " :b {bufspec} : Edit buffer. Consider using MiniBufExplorer.
    " [count]<C-^> : Switch to last used [or count] buffer
    " bd[!] : Delete (close) current buffer [! with force]
    " e[!] : edit a new file in the current buffer [! with force]
" }

" Windows {
    " :sp {path} : Open a new file in a new horizontal split window.s
    " <C-W><S-t> : Convert window to a tab. Can be used on preview window
    " <C-W>q : Quits a window
    " :only : Close all other windows
" }

" Tabs {
    " :tabnew : new tab
    " :tabs : show tabs
    " <C-PageUp/Down> : switch tabs
" }

" Macros {
    " [count]. : repeat last command (with new count)
    " [count]@: : repeat last command (count times)
    " q{letter}{commands}q : create macro
    " [count]@{letter} : play macro [count] times
    " @@ : play last macro again
" }

" Indenting {
    " >{motion} : indent
    " [count]>> : indent
    " [count]<<` : uindent
" }

" Tags {
    " http://vim.wikia.com/wiki/Browsing_programs_with_tags
    " :tags : view the tag history stack
    " :[s]tag {tagname} : jump to tag [in a new split]
    " <C-]> : jump to tag under cursor
    " g] : get a list of matching tags under cursor/visual selection
    " <C-W>g] : g] in a new split
    " :[s]tselect {tagname} : get a list of tag locations (under cursor/visual selection) [in a new split]
    " taglist({expr}) : Returns a list of tags matching the regular expression {expr}
    " set tags? : Filenames for the tag command
    " tagfiles() : Returns a List with the file names used to search for tags for the current buffer.
"}
