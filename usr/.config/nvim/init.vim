" theme settings
let &t_8f = "\<Esc>[41;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
set t_Co=254

syntax on
colorscheme tropical

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
call plug#begin('~/.config/nvim/plugged')
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'junegunn/goyo.vim'
	Plug 'preservim/nerdtree'
	Plug 'ap/vim-css-color'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'ryanoasis/vim-devicons'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'jiangmiao/auto-pairs'	
	Plug 'mhinz/vim-startify'
	Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server'}
call plug#end()

" text wrap
set wrap

" tabs
set autoindent
set noexpandtab
set tabstop=4
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
"" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"" shfmt
let g:shfmt_fmt_on_save = 1

"" ale
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_linters = {
	\ 'rust': ['analyzer'],
	\ 'go': ['golangci-lint'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'css': ['prettier'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'scss': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'graphql': ['eslint', 'prettier'],
	\ 'html': ['prettier'],
	\ 'json': ['prettier'],
	\ 'markdown': ['prettier'],
	\ 'lua': ['luacheck']
	\ }
let g:ale_fixers = {
	\ '*': [
		\ 'remove_trailing_lines',
		\ 'trim_whitespace'
		\ ],
	\ 'rust': ['rustfmt'],
	\ 'sh': ['shfmt'],
	\ 'zsh': ['shfmt'],
	\ 'python': ['black'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'css': ['prettier'],
	\ 'less': ['prettier'],
	\ 'scss': ['prettier'],
	\ 'json': ['prettier'],
	\ 'json5': ['prettier'],
	\ 'graphql': ['prettier'],
	\ 'markdown': ['prettier'],
	\ 'html': ['prettier'],
	\ 'yaml': ['prettier']
	\ }
let g:ale_rust_rls_toolchain = "stable"
let g:ale_fix_on_save = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = "--fast -E gofumpt -E unparam -E unconvert -E maligned -E goimports -E godot -E goconst"

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
