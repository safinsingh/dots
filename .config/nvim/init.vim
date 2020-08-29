" theme settings
let &t_8f = "\<Esc>[41;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
set t_Co=254

syntax on
colorscheme skybox

set ruler
set laststatus=2
set noshowmode 
set linebreak
set hidden
set cursorline

" compatibility
set nocompatible
filetype on

" plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/goyo.vim'
    Plug 'preservim/nerdtree'
call plug#end()

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

" statusline
set laststatus=2
set noshowmode

" keybinds
map <C-n> :NERDTreeToggle<CR>

" nuaNce's statusline
hi Sl1 ctermfg=none cterm=none ctermbg=NONE
hi Sl2 ctermfg=none cterm=none ctermbg=NONE
hi Sl3 ctermfg=none cterm=none ctermbg=NONE
hi Slrese ctermfg=none cterm=none ctermbg=none

function! RedrawMode(mode)
    if a:mode == 'n'
        return 'normal mode'
    elseif a:mode == 'i'
        return 'insert mode'
    elseif a:mode == 'R'
        return 'replace mode'
    elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
        return 'visual mode'
    elseif a:mode == 'c'
        return 'command mode'
    elseif a:mode == 't'
        return 'trace mode'
    endif
    return ''
endfunction


function! SetModifiedSymbol(modified)
    if a:modified == 1
        return '/ unsaved'
    else
        return ''
    endif
endfunction


function! SetFiletype(filetype)
    if a:filetype == ''
        return 'txt'
    else
        return a:filetype
    endif
endfunction

set statusline=%#Slrese#\ %{RedrawMode(mode())}\ %#Sl1#
set statusline+=%#Sl3#%{SetModifiedSymbol(&modified)}
set statusline+=%#SlRese#
set statusline+=%=
set statusline+=%#Sl2#\ %.20t\ //
set statusline+=\%#Sl2#\ %l,%c
