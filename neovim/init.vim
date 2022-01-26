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
Plug 'nvim-lualine/lualine.nvim'

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
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tami5/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'darrikonn/vim-gofmt'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

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
set foldmethod=indent
set foldlevelstart=999
set incsearch
set inccommand=nosplit
set noshowmode

" Plugin Configs
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

autocmd BufWritePre *.go GoFmt
autocmd BufWritePre *.go LspRestart

imap <C-j> <C-n>
imap <C-k> <C-p>

map - $

map ; :

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

nnoremap <SPACE>gf :GoFmt<CR>

" Lua Configs
lua << EOF

-- LSP Configs
require'lspconfig'.gopls.setup{}
require'lspconfig'.svelte.setup{}


local cmp = require'cmp'
cmp.setup({
 snippet = {
	expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
	end,
 },
 mapping = {
	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	['<C-e>'] = cmp.mapping({
	  i = cmp.mapping.abort(),
	  c = cmp.mapping.close(),
	}),
	-- Accept currently selected item. If none selected, `select` first item.
	-- Set `select` to `false` to only confirm explicitly selected items.
	['<CR>'] = cmp.mapping.confirm({ select = true }),
 },
 sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' }, -- For vsnip users.
	-- { name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.
 })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
 sources = {
	{ name = 'buffer' }
 }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
 sources = cmp.config.sources({
	{ name = 'path' }
 }, {
	{ name = 'cmdline' }
 })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gopls'].setup {
 capabilities = capabilities
}

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
				color_added = {
					fg = '#8BBD73'
				},
				color_modified = {
					fg = '#C46CD6'
				},
				color_removed = {
					fg = '#E2606D'
				},
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

