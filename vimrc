packadd! nord-vim
packadd vimcomplete

" Indentation

set autoindent " autoindentation for new lines
set expandtab " Convert tabs to spaces
set smarttab " insert spaces when tab key pressed
set tabstop=2 " indent using two spaces

" Search

set hlsearch " enable search highlighting
set ignorecase " ignore case when searching
set incsearch " incremental search with partial matches
set smartcase " switch to case sensitive when search includes uppercase letter

" performance

set complete-=i " limit files searched


" copying
set clipboard=unnamed


" text rendering

set encoding=utf-8
set display+=lastline " try to show paragraphs last line
set wrap " enable line wrapping
set linebreak " avoid wrapping line in middle of a word
syntax enable " enable syntax highlighting
set scrolloff=1 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.

" user interface

set laststatus=2 " always display status bar
set ruler " always show cursor position
set wildmenu " display command lines tab complete as a menu

colorscheme nord

set wildmode=longest,list,full
" set cursorline " highlight current line under cursor
set number " display line numbers
set noerrorbells " disable beep on errors
set visualbell " flash screen instead beeping

" code folding

set foldmethod=indent
set foldnestmax=3 " only fold up to three levels

" netrw

let g:netrw_banner = 0 " remove banner on top of netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" vimcomplete
let g:vimcomplete_tab_enable = 1

" misc

set backspace=indent,eol,start " allow backspacing over indent, line break, insertions
set history=1000 " increase history
set spell " enable spell checking
set noswapfile " disable swap files


