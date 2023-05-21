set nocompatible

" turn off filetype detection until plugins are loaded
filetype off

" if Plug isn't installed install it
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let plugins = [
    \ 'sheerun/vim-polyglot',
    \ 'rust-lang/rust.vim',
    \ 'arzg/vim-rust-syntax-ext',
    \ 'yggdroot/indentLine',
    \ 'dense-analysis/ale'
    \ ]

" install if any plugins are missing
if empty(glob('~/.vim/plugged')) || len(split(glob('~/.vim/plugged/*'), '\n')) < len(plugins)
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" if a colorscheme isn't installed install vscode dark
if len(glob('~/.vim/colors')) == 0
    silent !curl -fLo ~/.vim/colors/codedark.vim --create-dirs
        \ https://raw.githubusercontent.com/tomasiser/vim-code-dark/master/colors/codedark.vim
endif

call plug#begin()
    for plugin in plugins
        Plug plugin
    endfor
call plug#end()

syntax on
colorscheme codedark
set background=dark

set t_Co=256

" disable mouse
set mouse=

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

" prevents shifting
set signcolumn=yes

" turn on after plugins are loaded to get filetype detection
filetype plugin indent on

let g:indentLine_char = '▏'

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

let mapleader = ' '

set number
set relativenumber 

set ruler 
set visualbell

set encoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set scrolloff=3

set backspace=indent,eol,start

set ttyfast
set hlsearch
set incsearch

set showmatch
set matchtime=2
set matchpairs+=<:>
