Plugin 'tpope/vim-fugitive'
" auto delete fugitive buffers
augroup esoteric_fugitive
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
" :Git add %        :Gwrite     Stage the current file to the index
" :Git checkout %   :Gread      Revert current file to last checked in version
" :Git rm %         :Gremove    Delete the current file and the corresponding Vim buffer
" :Git mv %         :Gmove      Rename the current file and the corresponding Vim buffer
" :Gstatus
    " - :  add/reset file (works in visual mode too)
    " <Enter>     open current file in the window below
    " p   run `git add –patch` for current file
    " C   invoke :Gcommit
" :Gedit :0         :Gedit :%   :Gedit :path/to/file    open index version of file
" :Gedit branchname:path/to/file : Open read-only index version of file in any branch.
" :Gdiff    Vimdiff against index version of file. Index on left, WorkingTree on right
    " :Gwrite       Write from active buffer to the other buffer
    " :Gread        Reads into active buffer from the other buffer
    " :diffget      vimdiff get change into active buffer from other buffer
    " :diffput      vimdiff put change from active buffer to other buffer
" :Gdiff    Vimdiff merge conflicts. Target (active) branch on left, Working tree conflicted file, Merge (from) branch on right.
    " Target branch always have //2 in name, to be used in bufspec.
    " Merge branah always have //3 in name, to be used in bufspec.
    " :diffget {bufspec} : vimdiff get change into active buffer (usually working tree buffer) from specfied buffer
    " :dp                : vimdiff put change from active buffer to the working tree buffer (special Gdiff assumption)
    " :Gwrite!           : Write and add into index from active buffer. Exclamation needed in conflict mode.
" Ggrep : git grep : grep in tracked files
" Glog -- : load log into quickfix list
" Glog -- % : load log that touch current file into quickfix list
" Glog --grep=searchstring -- : search for findme in commit messages
" Glog -Sadded_or_removed_text -- : search for added or removed text in comit messages
