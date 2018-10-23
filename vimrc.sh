#!/usr/bin/env bash
"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"html
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'

Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
"=======================
"power line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()

filetype plugin indent on    " enables filetype detection
"========================================================
"Pro Tip #5: Try this if you want to see the docstrings for folded code:
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
"You Complete Me python
"let g:ycm_python_binary_path = 'python'
let g:ycm_python_binary_path = '/usr/bin/python3'
"===============================================

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"=============================================================
call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files / backup files
set noswapfile
set nobackup
set nowritebackup
"turn on numbering
set nu

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start
"=============================
"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------
"===============================================
"NerdTree use with CTR o
" How can I map a specific key or shortcut to open NERDTree?

" Stick this in your vimrc to open NERDTree with Ctrl+o (you can set whatever key you want):

map <C-o> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?

" Stick this in your vimrc:

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"====================================================================================================
"Pro Tip #2: You can also specify different areas of the screen where the splits should occur
"by adding the following lines to the .vimrc file:

set splitbelow
set splitright
"=============
"Pro Tip #3: Want to move between the splits without using the mouse?
"If you simply add the following to .vimrc, you’ll be able to jump between splits with just one key combination:
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"========================
"Move a block of code
vnoremap < <gv
vnoremap > >gv
"=============
"Code Folding
"Most “modern” IDEs provide a way to collapse (or fold) methods and classes,
"showing you just the class/method definition lines instead of all the code.
"You can enable that in .vimrc with the following lines:
"Enable folding
set foldmethod=indent
set foldlevel=99
"This works all right, but you have to type za to fold (and unfold). The space key would be much better.
"So add this line to your .vimrc file as well:
" Enable folding with the spacebar
nnoremap <space> za
"==================
"Then, just add a bit of logic to define which scheme to use based upon the VIM mode:

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
"====================
