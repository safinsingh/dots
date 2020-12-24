" theme settings
let &t_8f = "\<Esc>[41;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
set t_Co=254

syntax on
colorscheme siori
syntax on

set ruler
set laststatus=2
set noshowmode
set linebreak
set hidden

" compatibility
set nocompatible
filetype on

" plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'sheerun/vim-polyglot'
	Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
	Plug 'junegunn/goyo.vim'
	Plug 'preservim/nerdtree'
	Plug 'ap/vim-css-color'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'ryanoasis/vim-devicons'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

" text wrap
set wrap

" tabs
set autoindent
set noexpandtab
set tabstop=4

" searching
set ignorecase

" backups
set nobackup
set noswapfile

" statusbar
set laststatus=2
set noshowmode

" extension-specific settings
"" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"" shfmt
let g:shfmt_fmt_on_save = 1

"" comments
let g:NERDSpaceDelims = 1

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

set shiftwidth=4
