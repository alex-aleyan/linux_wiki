set background=dark
highlight normal ctermfg=grey ctermbg=black cterm=none
set tabstop=1     #defines number of spaces a tabstop takes
set softtabstop=4 #hitting TAB indents by 4 tabstops (see line above)
set syntax=bash
set nu
set autoindent
set guifont=14
syntax on
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch                                                                                                                                                                                                    
set incsearch

" from https://github.com/DJMcMayhem/dotFiles/blob/master/.vimrc#L187
autocmd VimResized * wincmd =
