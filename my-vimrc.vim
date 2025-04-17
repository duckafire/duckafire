"" Author: DuckAfire
"" License: MIT
"" Repository: https://github.com/duckafire/duckafire

" PLUG MANAGER FROM: github.com/junegunn/vim-plug
call plug#begin()
	Plug 'kshenoy/vim-signature'
call plug#end()

" PLUG CONFIGURATIONS:

" vim-signature
hi SignatureMarkText ctermfg=230 ctermbg=245 cterm=italic

 " VIM CONFIGURATION:

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
set splitright
set splitbelow

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
set nobackup
set noautowrite

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
set dir=~/.vim/swap " this folder must be created
set backupdir=~/.vim/backup " this folder must be created
set formatoptions=n
set history=50
set nrformats=bin,octal,hex
set shell=/bin/bash
set wildignore=
set softtabstop=0
set scrolloff=25
set cmdheight=1
set conceallevel=0
set foldlevel=999

filetype on
syntax on
colorscheme default

" VIM STYLE

" cursor style: 0: blinking block. | 1: blinking block (default). | 2: steady block. | 3: blinking underline. | 4: steady underline. | 5: blinking bar (xterm). | 6: steady bar (xterm).
let &t_SI = "\<Esc>[6 q" " Start Insert
let &t_SR = "\<Esc>[4 q" " Start Replace
let &t_EI = "\<Esc>[2 q" " End Insert

" 'bagunçado'

hi Search       ctermfg=red    ctermbg=none cterm=underline
hi IncSearch    ctermfg=green  ctermbg=none cterm=underline
hi MatchParen   ctermfg=yellow ctermbg=NONE cterm=underline,bold
hi LineNr       ctermfg=68     ctermbg=236  cterm=bold
hi CursorLineNr ctermfg=230    ctermbg=238  cterm=bold
hi SignColumn                  ctermbg=241
hi CursorLine                  ctermbg=235  cterm=NONE
hi String       ctermfg=135                 cterm=bold
hi Constant     ctermfg=198                 cterm=italic
hi Comment      ctermfg=71                  cterm=italic
hi Normal       ctermbg=233
hi NonText      ctermfg=245                 cterm=bold
hi Number       ctermfg=blue
hi StatusLine   ctermfg=white  ctermbg=68   cterm=bold
hi Special      ctermfg=190
