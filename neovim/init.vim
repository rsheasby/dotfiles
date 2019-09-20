" init.vim 2 electric boogaloo
call plug#begin()

" Tim Pope bae
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'

Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'yuttie/comfortable-motion.vim'
Plug 'wellle/targets.vim'
Plug 'dhruvasagar/vim-prosession'
Plug 'airblade/vim-gitgutter'
Plug 'moll/vim-bbye'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/echodoc.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

" Plugin Options

let g:ale_lint_on_enter = 0
autocmd BufRead * ALELint

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

let g:echodoc#enable_at_startup = 1

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree
			\ nnoremap <buffer> <ESC> <C-w><C-w>|
			\ nmap <buffer> <C-p> <ESC>|
			\ nmap <buffer> <C-h> <ESC><C-h>|
			\ nmap <buffer> <C-l> <ESC><C-l>|
			\ nmap <buffer> <C-d> <ESC><C-d>|
			\ nmap <buffer> <C-f> <ESC><C-f>|
			\ nnoremap <buffer> o :call NERDTreeExecFile()<CR><CR><CR>|
			\ nnoremap <buffer> O :call NERDTreeExecFile()<CR><Home>explorer /select,<CR><CR>

let delimitMate_expand_cr = 1
let g:dispatch_no_maps = 1

" Plugin Keymaps

map <C-c><C-r> :GoRename<CR>

map <C-p> :NERDTreeFocus<CR>

nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

map <Leader> <Plug>(easymotion-prefix)

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

let g:comfortable_motion_friction = 120.0
let g:comfortable_motion_air_drag = 2.0

" Regular Keymaps

imap <silent><expr> <bs>
			\ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
			\ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
			\ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
			\ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : '<Plug>delimitMateBS'

map - $

vnoremap <A-j> gj
vnoremap <A-k> gk
nnoremap <A-j> gj
nnoremap <A-k> gk

imap <C-j> <C-n>
imap <C-k> <C-p>

nmap <SPACE>fs :w<CR>
nmap <SPACE>qq :qa<CR>
nmap <SPACE>qw :q<CR>

nmap ; :

vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y

vnoremap <leader>d  "+d
nnoremap <leader>D  "+D
nnoremap <leader>d  "+d

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

vmap <C-_> gcgv
nmap <C-_> gcc

vmap <C-/> gcgv
nmap <C-/> gcc

nmap <C-d> :Bdelete<CR>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <ESC> :noh<CR><ESC>

nnoremap ` ~h

" Regular options

set hidden
set scrolloff=7
set noexpandtab
set shiftwidth=3
set tabstop=3
set noshowmode
set breakindent
set mouse=a
set number
set relativenumber
set linebreak
set undofile
set undodir=~/.vim/undodir
set backupdir=~/.vim/backups
set ignorecase
set smartcase
set cursorline
set foldmethod=syntax
set foldlevelstart=999
set confirm
set updatetime=200
set incsearch
set inccommand=nosplit


