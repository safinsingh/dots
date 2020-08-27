" compatibility
set nocompatible
filetype on

" plugins
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'sainnhe/gruvbox-material'
  Plug 'junegunn/goyo.vim'
call plug#end()

" syntax
syntax on

" line nums
set nu rnu

" text wrap
set wrap

" tabs
set tabstop=2
set autoindent
set expandtab
set softtabstop=2

" searching
set ignorecase

" backups
set nobackup
set noswapfile

" statusbar
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_Co=256
endif

" theme
set termguicolors
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
colorscheme gruvbox-material
set background=dark

" cursor
set guicursor+=a:blinkon0
let &t_SI .= "\<Esc>[4 q"

" keybinds
" map <C-f
