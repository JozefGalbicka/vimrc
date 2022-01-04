" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Just some plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

" Colorscheme
set background=dark
colorscheme gruvbox
syntax on

" Make .yml files to indent 1Tab=2Spaces
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Wildmenu for commands
set wildmenu
set wildmode=list:longest

" Hide buffer
set hidden

" New line with same indentation on undefinied file types
set autoindent

" Add number column
set number

" Highlight cursor line
set cursorline

" Interactive search
set incsearch
set ignorecase
set smartcase
set hlsearch
