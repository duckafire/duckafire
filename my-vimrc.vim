"" Author: DuckAfire
"" License: MIT
"" Repository: https://github.com/duckafire/duckafire
"" Last Change: 2025.04.16

" plug manager from: github.com/junegunn/vim-plug
call plug#begin()

call plug#end()

set number
set autoindent
set hlsearch
set incsearch
set lazyredraw
set ruler
set wildmenu
set cursorline
set linebreak " 'nowrap' made this redundant
set foldenable
set confirm
set modeline
set swapfile

set noexpandtab
set noshiftround
set nosmarttab
set noignorecase
set nosmartcase
set nowrap
set norelativenumber
set noerrorbells
set novisualbell
set notitle
set noautoread
set nohidden
set nospell

set tabstop=4
set shiftwidth=4
set complete=.,w,b,u,t,i
set encoding=utf-8
set display=
set laststatus=2
set tabpagemax=10
set mouse=
set background=dark
set foldmethod=indent
set foldnestmax=20
set backspace=indent,eol,start
set dir=~/.cache/vim " this folder must be created
set backupdir=~/.cache/vim " this folder must be created
set formatoptions=
set history=50
set nrformats=bin,octal,hex
set shell="/usr/bin/env bash"
set wildignore=

filetype on
syntax on
colorscheme default

" 0: blinking block. | 1: blinking block (default). | 2: steady block. | 3: blinking underline.
" 4: steady underline. | 5: blinking bar (xterm). | 6: steady bar (xterm).
let &t_SI = "\<Esc>[6 q" " Start Insert
let &t_SR = "\<Esc>[4 q" " Start Replace
let &t_EI = "\<Esc>[2 q" " End Insert
