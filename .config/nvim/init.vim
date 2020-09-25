" theme settings
let &t_8f = "\<Esc>[41;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
set t_Co=254

syntax on
colorscheme terra

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
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'
	Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
    Plug 'andrejlevkovitch/vim-lua-format'
    Plug 'wakatime/vim-wakatime'
    Plug 'safinsingh/terra.vim'
call plug#end()

" line nums
set nu rnu

" text wrap
set wrap

" tabs
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
" set list lcs=tab:\›\ 

" searching
set ignorecase

" backups
set nobackup
set noswapfile

" statusbar
set laststatus=2
set noshowmode

" extension-specific settings
let g:rustfmt_autosave = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 80
let g:prettier#config#use_tabs = 'false'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:shfmt_fmt_on_save = 1
autocmd BufWrite *.lua call LuaFormat()

" keybinds
map <C-n> :NERDTreeToggle<CR>
map <C-f> :BLines<CR>
map <C-j> :GFiles<CR>
map <C-l> :set nonumber! norelativenumber!<CR>
map <C-t> :FloatermNew --height=0.8 --width=0.8<CR>

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
        return '// unsaved'
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

