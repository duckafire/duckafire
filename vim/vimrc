" Author: DuckAfire
"
" Repository:
" * GitHub: https://github.com/duckafire/duckafire
" * GitLab: https://gitlab.com/duckafire/duckafire
"
" License:
"
" MIT License
"
" Copyright (c) 2024-2025 DuckAfire <duckafire.github.io/nest>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.


call plug#begin()
	" features
	Plug 'kshenoy/vim-signature' " commend line 54, 55, and 56 from '~/.vim/plugged/vim-indentguides/plugin/indentguides.vim'
	Plug 'thaerkh/vim-indentguides'

	" syntax
	Plug 'pangloss/vim-javascript'
	Plug 'cakebaker/scss-syntax.vim'
	Plug 'leafgarland/typescript-vim'

	" colorschemes
	Plug 'duckafire/ancient-vim'

call plug#end()

" PLUG CONFIGURATIONS:
" vim-signature
" SignatureMarkLine
hi! SignatureMarkText   ctermfg=white ctermbg=black cterm=none
hi! SignatureMarkerText ctermfg=green ctermbg=black cterm=none
hi! SignatureMarkerLine ctermfg=none  ctermbg=235   cterm=bold

" vim-indentguides
let g:indentguides_ignorelist = []
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_concealcursor_unaltered=1

" ancient-vim
let g:languages_to_ancient_vim = ["c", "cpp", "lua", "javascript", "typescript", "java", "python"]


" VIM CONFIGURATION:

" enable
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
set list

" disable
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

" values
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
set listchars=tab:\|\ ,trail:·,extends:»,precedes:« " remove `eol:$` (influence vim-indentguides)
set completeopt=menu,preview,noselect

filetype on
syntax on
colorschem ancient


" CURSOR STYLE:
" * 0: blinking block.
" * 1: blinking block (default).
" * 2: steady block.
" * 3: blinking underline.
" * 4: steady underline.
" * 5: blinking bar (xterm).
" * 6: steady bar (xterm).
let &t_SI = "\<Esc>[6 q" " Start Insert
let &t_SR = "\<Esc>[4 q" " Start Replace
let &t_EI = "\<Esc>[2 q" " End Insert


augroup MARKDOWN_LINE_LIMIT
	autocmd!
	autocmd BufRead,BufNewFile *.md setlocal colorcolumn=90
	autocmd FileType markdown setlocal colorcolumn=90
augroup END

augroup STRING_AS_AN_INDEX
	autocmd!
	" strings between []:
	" ['foo'] ["foo"]
	autocmd BufRead,BufNewFile * call matchadd("SpecialChar", "\\v\\[\\s*\\zs(('[^']*')|(\"[^\"]*\"))\\ze\\s*\\]")
augroup END

augroup C_CUSTOM_TYPES
	autocmd!
	" identifiers after `struct` or `enum`:
	" enum foo; struct foo;
	" identifiers suffixed by `_t`:
	" foo_t bar_t
	autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp,*.cc,*.cxx call matchadd("cType", '\v((struct|enum)\s+\zs\h\w*\ze|(\h\w*_t))')
	autocmd FileType c,cpp call matchadd("cType", '\v((struct|enum)\s+\zs\h\w*\ze|(\h\w*_t))')
augroup END
