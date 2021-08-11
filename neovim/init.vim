call plug#begin('~/.vim/vim-plug/')

" Bow to Tim Pope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'

" Customization
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'shadmansaleh/lualine.nvim'

" Editor Behaviour
Plug 'windwp/nvim-autopairs'
Plug 'romgrk/barbar.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'yuttie/comfortable-motion.vim'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'kdheepak/lazygit.nvim'

" Language Support/Autocomplete
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'glepnir/lspsaga.nvim'
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}
Plug 'ray-x/lsp_signature.nvim'

" Load session after all other plugins
Plug 'dhruvasagar/vim-prosession'

call plug#end()

" Customization
set background=dark
colorscheme palenight
set completeopt=menuone,noselect
set termguicolors
set updatetime=100
set confirm
set hidden
set scrolloff=7
set noexpandtab
set shiftwidth=3
set tabstop=3
set breakindent
set mouse=a
set number
set linebreak
set undofile
set undodir=~/.vim/undodir
set backupdir=~/.vim/backupdir
set ignorecase
set smartcase
set cursorline
set foldmethod=syntax
set foldlevelstart=999
set incsearch
set inccommand=nosplit
set noshowmode

" Plugin Configs
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
let g:compe.max_abbr_width = 200
let g:compe.max_kind_width = 200
let g:compe.max_menu_width = 200
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

let g:lazygit_floating_window_use_plenary = 0
let g:lazygit_floating_window_winblend = 5
let g:lazygit_use_neovim_remote = 0

" Plugin maps
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent><SPACE>ca :Lspsaga code_action<CR>
vnoremap <silent><SPACE>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>gr :Lspsaga rename<CR>

nnoremap <silent> <SPACE>gg :LazyGit<CR>

map <Leader> <Plug>(easymotion-prefix)

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
autocmd VimLeave * NERDTreeClose

map <C-p> :NERDTreeFocus<CR>

nnoremap <silent> <C-j> :call comfortable_motion#flick(120)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-120)<CR>

" Regular maps
imap <C-j> <C-n>
imap <C-k> <C-p>

map - $

nmap ; :

vnoremap <A-j> gj
vnoremap <A-k> gk
nnoremap <A-j> gj
nnoremap <A-k> gk

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

imap <D-v> <C-r>*

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

vmap <C-/> gcgv
nmap <C-/> gcc

nnoremap <C-h> :BufferPrevious<CR>
nnoremap <C-l> :BufferNext<CR>
nnoremap <C-d> :BufferClose<CR>

nnoremap <silent> <ESC> :noh<CR><ESC>

nmap <SPACE>fs :w<CR>
nmap <SPACE>qq :qa<CR>
nmap <SPACE>qw :q<CR>

nmap <SPACE>fr :%s/

nnoremap <SPACE>gf mg:%!gofmt -s<CR>'gzz

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

require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'onedark',
		component_separators = {'|', '|'},
		section_separators = {'', ''},
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
			'branch',
			{
				'diff',
				colored = true,
				color_added = '#8BBD73',
				color_modified = '#C46CD6',
				color_removed = '#E2606D',
				symbols = {added = '+', modified = '~', removed = '-'}
			}
		},
		lualine_d = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {'filename'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

EOF

" Load session last
let g:prosession_last_session_dir = '/'

