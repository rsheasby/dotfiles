""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                                 LOAD PLUGINS                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Must be loaded first.
Plug 'tpope/vim-obsession'                                 " obsession.vim: continuously updated session files

Plug 'airblade/vim-gitgutter'                              " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'alvan/vim-closetag'                                  " Auto close (X)HTML tags
Plug 'ap/vim-buftabline'                                   " Forget Vim tabs – now you can have buffer tabs
Plug 'dhruvasagar/vim-prosession'                          " Handle vim sessions like a pro
Plug 'easymotion/vim-easymotion'                           " Vim motions on speed!
Plug 'godlygeek/tabular'                                   " Vim script for text filtering and alignment
Plug 'haya14busa/vim-easyoperator-line'                    " Select, yank, paste, delete, or other operation of lines.
Plug 'haya14busa/vim-easyoperator-phrase'                  " Select, yank, paste, delete, or other operation of phrase.
Plug 'HerringtonDarkholme/yats.vim'                        " Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim
Plug 'jason0x43/vim-js-indent'                             " Vim indenter for standalone and embedded JavaScript
Plug 'junegunn/fzf'                                        " A command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                    " fzf vim
Plug 'junegunn/seoul256.vim'                               " Low-contrast Vim color scheme based on Seoul Colors
Plug 'leafgarland/typescript-vim'                          " Typescript syntax files for Vim
Plug 'mattn/emmet-vim'                                     " emmet for vim: http://emmet.io/
Plug 'moll/vim-bbye'                                       " Delete buffers and close files in Vim without closing your windows or messing up your layout.
Plug 'nathanaelkane/vim-indent-guides'                     " A Vim plugin for visually displaying indent levels in code
Plug 'pangloss/vim-javascript'                             " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'Raimondi/delimitMate'                                " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'scrooloose/nerdtree'                                 " A tree explorer plugin for vim.
Plug 'skywind3000/gutentags_plus'                          " The right way to use gtags with gutentags
Plug 'tpope/vim-abolish'                                   " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-commentary'                                " commentary.vim: comment stuff out
Plug 'tpope/vim-dispatch'                                  " dispatch.vim: Asynchronous build and test dispatcher
Plug 'tpope/vim-eunuch'                                    " eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-fugitive'                                  " fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat'                                    " repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-sensible'                                  " sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-speeddating'                               " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'                                  " surround.vim: quoting/parenthesizing made simple
Plug 'vim-airline/vim-airline'                             " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'                      " A collection of themes for vim-airline
Plug 'w0rp/ale'                                            " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plug 'wellle/targets.vim'                                  " Vim plugin that provides additional text objects
Plug 'Xuyuanp/nerdtree-git-plugin'                         " A plugin of NERDTree showing git status
Plug 'yuttie/comfortable-motion.vim'                       " Brings physics-based smooth scrolling to the Vim world!

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                         SET BUFFER-SPECIFIC KEYMAPS                          "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree
			\ nnoremap <buffer> <ESC> <C-w><C-w>|
			\ nmap <buffer> <C-p> <ESC>|
			\ nmap <buffer> <C-b> <ESC><C-b>|
			\ nmap <buffer> <C-n> <ESC><C-n>|
			\ nmap <buffer> <C-d> <ESC><C-d>|
			\ nmap <buffer> <C-f> <ESC><C-f>|
			\ nnoremap <buffer> o :call NERDTreeExecFile()<CR><CR><CR>|
			\ nnoremap <buffer> O :call NERDTreeExecFile()<CR><Home>explorer /select,<CR><CR>

autocmd FileType lisp
			\ vnoremap <buffer> <leader>xa :!boxes -d lisp_plain -a hc -s 80<CR>|
			\ vnoremap <buffer> <leader>xr :!boxes  -r -d lisp_plain -a hc -s 80<CR>

autocmd FileType vim
			\ vnoremap <buffer> <leader>xa :!boxes -d vim-box -a hc -s 80<CR>|
			\ vnoremap <buffer> <leader>xr :!boxes  -r -d vim-box -a hc -s 80<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                             SET REGULAR KEYMAPS                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F10> magg=G'a

nnoremap <silent> <ESC> :noh<CR><ESC>

colorscheme seoul256
let g:airline_theme='deus'

map <C-p> :NERDTreeFocus<CR>
map <C-f> :FZF<CR>

imap <C-j> <C-n>
imap <C-k> <C-p>

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

let g:comfortable_motion_friction = 120.0
let g:comfortable_motion_air_drag = 2.0

noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>

nnoremap <A-j> gj
nnoremap <A-k> gk

nnoremap <C-d> :Bdelete<CR>
nnoremap <A-w> :q<CR>

nnoremap <C-g> g<C-]>

nnoremap < <<
nnoremap > >>
vnoremap , <gv
vnoremap . >gv
vnoremap < <gv
vnoremap > >gv

nmap ; :

map <Leader> <Plug>(easymotion-prefix)

" Copy to system clipboard when command preceeded by the leader key
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from system clipboard when command preceeded by the leader key
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Comment toggle using Ctrl-/
vmap <C-/> gcgv
nmap <C-/> gcc

" Hungry delete auto-indented lines
imap <silent><expr> <bs>
			\ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
			\ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
			\ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
			\ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : '<Plug>delimitMateBS'

imap <F12> <C-y>,
nmap <F12> <C-y>,
vmap <F12> <C-y>,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                               SET VIM SETTINGS                               "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=5
set noshowmode
set hidden
set noexpandtab
set cinoptions=(0,u0,U0
set softtabstop=0
set shiftwidth=2
set tabstop=2
set cindent
set mouse=a
set number
set relativenumber
set linebreak
set updatetime=100
set undofile
set undodir=~/.config/nvim/undodir
set ignorecase
set smartcase
set cursorline
set foldmethod=indent
set foldlevelstart=999
set confirm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                             SET PLUGIN SETTINGS                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctab_filetype_maps = 1
let g:nvim_typescript#javascript_support = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:nerdtree_open_cmd = 'open'
let g:vim_json_syntac_conceal = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 7
let g:python3_host_prog = 'C:\Program Files (x86)\Python37-32\python.exe'
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = '(:),[:],{:}'
let delimitMate_quotes = "\" ' ``'"
let g:indent_guides_enable_on_vim_startup = 1
