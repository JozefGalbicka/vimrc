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
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'Einenlum/yaml-revealer'
Plug 'elkowar/yuck.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'hashivim/vim-terraform'
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

let g:Hexokinase_highlighters = ['backgroundfull']

set encoding=utf-8

" https://wiki.archlinux.org/title/St#Vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:airline_symbols = {}
let g:airline_symbols.linenr = ' ln:'

" Colorscheme
set background=dark
silent! colorscheme gruvbox
syntax on
set termguicolors 

" Make .yml files to indent 1Tab=2Spaces
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Wildmenu for commands
set wildmenu
set wildmode=list:longest

" Hide buffer
set hidden

" Show partial command 
set showcmd

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

" Snippets autocomplete"
let g:UltiSnipsExpandTrigger="<c-space>"

" Disable auto-indent when commenting lines in yaml files
autocmd FileType yaml,yaml.ansible set indentkeys-=0#

" Paste without :set paste
" https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
" https://cirw.in/blog/bracketed-paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

let mapleader = ","
inoremap kj <Esc>

" fzf
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>l :Lines<cr>
nnoremap <Leader>a :Buffers<cr>

nnoremap  <silent> <Leader><Tab>    :bnext<CR> 
nnoremap  <silent> <Leader><S-Tab>  :bprevious<CR>

" NERDTree 
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <Leader>t :NERDTreeFocus<cr>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
