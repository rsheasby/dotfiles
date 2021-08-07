call plug#begin('~/.vim/vim-plug/')

" Bow to Tim Pope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'

" Customization
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Editor Behaviour
Plug 'windwp/nvim-autopairs'
Plug 'romgrk/barbar.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'yuttie/comfortable-motion.vim'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dhruvasagar/vim-prosession'

" Language Support/IDE Features
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'

call plug#end()

" Customization
set background=dark
colorscheme palenight
set completeopt=menuone,noselect
set termguicolors

" Plugin Configs
let g:prosession_last_session_dir = '/'

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:false
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.ultisnips = v:false
let g:compe.source.luasnip = v:false
let g:compe.source.emoji = v:false

let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 140.0
let g:comfortable_motion_air_drag = 2.0

" Plugin maps

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>gr :Lspsaga rename<CR>

map <Leader> <Plug>(easymotion-prefix)

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

map <C-p> :NERDTreeFocus<CR>

nnoremap <silent> <C-j> :call comfortable_motion#flick(120)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-120)<CR>

" Regular maps
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" Lua Configs
lua << EOF

-- LSP Configs
require'lspconfig'.gopls.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
}

local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = 'X',
  warn_sign = '!',
  hint_sign = '#',
  infor_sign = '?',
  border_style = "round",
  finder_action_keys = {
    open = {'<CR>', 'o'}, vsplit = 's',split = 'i',quit = {'q', '<esc>', '<C-c>'},
    scroll_down = '<C-f>',scroll_up = '<C-b>'
  },
  code_action_keys = {
    quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<esc>', '<C-c>'}, exec = '<CR>'
  },
}

require "lsp_signature".setup()

-- Editor Behaviour
require('nvim-autopairs').setup{}

EOF
