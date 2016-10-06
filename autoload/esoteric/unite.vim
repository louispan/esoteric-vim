function! esoteric#unite#setup()
    " fuzzy default
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " remove 'matcher_hide_hidden_files'
    call unite#custom#source(
      \ 'file,directory,file_rec,file_rec/async,directory,neomru/file,neomru/directory,bookmark',
      \ 'matchers',
      \ ['matcher_fuzzy',
      \  'matcher_hide_current_file'])

    " Don't sort the mru sources
    call unite#custom#source(
      \ 'file,directory,file_rec,file_rec/async,directory',
      \ 'sorters',
      \ ['sorter_selecta'])
endfunction

function! esoteric#unite#default_dir_symbol_to_path(default_dir_symbol)
    let path = ""
    if a:default_dir_symbol == '?'
        let path = unite#helper#get_buffer_directory(bufnr('%'))
    elseif a:default_dir_symbol == "?!"
        let path = unite#helper#get_buffer_directory(bufnr('%'))
        let path = unite#util#path2project_directory(path)
    elseif a:default_dir_symbol == "!"
        let path = unite#util#path2project_directory(getcwd())
    endif
    return path
endfunction

function! esoteric#unite#get_last_buffer_name()
    " From unite.vim/autoload/unite/view.vim:unite#view#_close
    " Use last unite buffer.
    if !exists('t:unite') ||
          \ !bufexists(t:unite.last_unite_bufnr)
        return ""
    endif

    return getbufvar(t:unite.last_unite_bufnr, 'unite').buffer_name
endfunction

function! esoteric#unite#unite_with_default_inputs(sources, options, prompt_dir, default_dir_symbol, prompt_input, text, register)
    " Close previous unite buffer so that the resolution of default_dir_symbol is from editing buffer, not unite buffer

    let last_buffer_name = esoteric#unite#get_last_buffer_name()
    if last_buffer_name != ""
        if unite#view#_close('') && get(a:options, 'toggle', 0) != 0 && last_buffer_name == get(a:options, 'buffer_name', 'default')
          return
        endif
    endif
    let path = esoteric#unite#default_dir_symbol_to_path(a:default_dir_symbol)
    if a:prompt_dir != 0
        let path = input('Path: ', path, 'dir')
    endif
    let text = a:text
    if a:prompt_input != 0
        let text = input('Text: ', text)
    endif
    if a:register != ""
        execute 'let @' . a:register . ' = "' . text . '"'
    endif
   if a:prompt_input != 0 && text == ""
        call unite#print_error("Empty Text")
    else
        " NB. unite options separators are converted from - to _
        let opt = copy(a:options)
        if path != ""
            let opt.path = path
        endif
        if text != ""
            let opt.input = text
        endif
        let opt.silent = 1

        call unite#start(a:sources, opt)
    endif
endfunction

function! esoteric#unite#make_insert_mappings(key)
    execute printf('imap <unique><silent> <ESC>%s <C-c><ESC>%s', a:key, a:key)
    execute printf('cmap <unique><silent> <ESC>%s <Nop>', a:key)
endfunction

function! esoteric#unite#make_basic_mappings(key, sources, options)
    call esoteric#unite#make_default_dir_mappings(a:key, a:sources, a:options, 0, "")
endfunction

function! esoteric#unite#make_default_dir_mappings(key, sources, options, prompt_dir, default_dir_symbol)
    execute printf('map <unique><silent> <ESC>%s :<C-u>call esoteric#unite#unite_with_default_inputs(%s,%s,%d,"%s",0,"","")<CR>',
        \ a:key, string(a:sources), string(a:options), a:prompt_dir, a:default_dir_symbol)
    call esoteric#unite#make_insert_mappings(a:key)
endfunction

function! esoteric#unite#make_default_dir_with_cursor_word_mappings(key, sources, options, prompt_dir, default_dir_symbol, prompt_input, register)
    execute printf('nmap <unique><silent> <ESC>%s :<C-u>call esoteric#unite#unite_with_default_inputs(%s,%s,%d,"%s",%d,expand("<cword>"),"%s")<CR>',
        \ a:key, string(a:sources), string(a:options), a:prompt_dir, a:default_dir_symbol, a:prompt_input, a:register)
    execute printf('vmap <unique><silent> <ESC>%s "%sy:call esoteric#unite#unite_with_default_inputs(%s,%s,%d,"%s",%d,@%s,"%s")<CR>',
        \ a:key, a:register, string(a:sources), string(a:options), a:prompt_dir, a:default_dir_symbol, a:prompt_input, a:register, a:register)
     call esoteric#unite#make_insert_mappings(a:key)
endfunction

function! esoteric#unite#make_resume_mappings(key, buffer_name)
    execute printf('map  <unique><silent> <ESC>%s :<C-u>UniteResume %s<CR>', a:key, a:buffer_name)
    execute printf('imap <unique><silent> <ESC>%s <C-c><ESC>%s', a:key, a:key)
    execute printf('cmap <unique><silent> <ESC>%s <Nop>', a:key)
endfunction