Opinionated customisations for vim.

Uses hijackey-vim (https://github.com/louispan/hijackey-vim) to enable Ctrl+Shift+Alpha key combinations.

# Installation

If you are using Vundle, add the following to your `.vimrc`:

```
Plugin 'louispan/esoteric-vim'
if filereadable(expand("~/.vim/bundle/esoteric-vim/bundle/bundle.vim"))
    source ~/.vim/bundle/esoteric-vim/bundle/bundle.vim
endif
```

Then at the end of your .vimrc
```
call esoteric#esoteric#setup()
```

See https://github.com/louispan/esoteric/blob/master/etc/.vimrc for an example.

For more control, look at the definition esoteric#esoteric#setup to only turn
particular esoteric settings on.
