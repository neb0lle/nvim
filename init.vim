call plug#begin()
" SYNTAX:
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" LSP:
	Plug 'neovim/nvim-lspconfig'
	Plug 'onsails/lspkind-nvim'
" COMPLETION:
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
" SNIPPETS:
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
" GIT:
	Plug 'tpope/vim-fugitive'
" THEME:
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" FZF:
	Plug 'nvim-telescope/telescope.nvim'
" MISC:
    Plug 'vimwiki/vimwiki'
	Plug 'glepnir/dashboard-nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'christoomey/vim-tmux-navigator'
call plug#end()

"	General Settings:
let mapleader=' '
syntax on
filetype plugin indent on
set nocompatible
set number relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set smartcase
set ignorecase
set incsearch

set noswapfile
set nobackup
set undofile
set clipboard=unnamedplus

set splitbelow
set splitright
set autowrite
set noendofline
set nofixendofline
set autoread

set smartindent
set autoindent
set smarttab
set noexpandtab
set tabstop=4 
set shiftwidth=4
set softtabstop=4
set scrolloff=8

"	Theme:
set background=dark
set cmdheight=1
set showtabline=0
set laststatus=2
set noshowmode
set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_transparent = 1
let g:tokyonight_lualine_bold = 1
colorscheme tokyonight

" TREESITTER:
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	},
}
EOF

" LSP:
set completeopt=menu,menuone,noselect
lua <<EOF
local lsp = require 'lspconfig'
local cmp = require'cmp'
local lspkind = require('lspkind')

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format(),
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			  if cmp.visible() then
				cmp.select_next_item()
			  elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			  elseif has_words_before() then
				cmp.complete()
			  else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			  end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function()
			  if cmp.visible() then
				cmp.select_prev_item()
			  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			  end
			end, { "i", "s" }),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable,
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
	},
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
		}, {
			{ name = 'buffer' },
	}),
	experimental = {
		ghost_text = true;
		},
	})

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
	})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
			{ name = 'path' }
			}, {
			{ name = 'cmdline' }
			})
	})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp.clangd.setup { capabilities = capabilities }
lsp.pyright.setup { capabilities = capabilities }
lsp.rust_analyzer.setup { capabilities = capabilities }
EOF

" LUALINE:
lua <<EOF
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
		always_divide_middle = true,
		section_separators = '',
		component_separators = '',
		},
	extensions = {
		'fugitive',
		'fzf',
		},
	}
EOF

" DASHBOARD:
highlight dashboardFooter ctermfg=20 guifg=#01fDB0
let g:dashboard_default_executive ='telescope'
let g:indentLine_fileTypeExclude = ['dashboard','txt']
let g:dashboard_custom_header = [
    \'',
    \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
    \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
    \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
    \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
    \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
    \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
    \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
    \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
    \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
    \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
    \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    \'',]
lua <<EOF
vim.g.dashboard_footer_icon = ' '
vim.g.dashboard_custom_section = {
    a = {description = {' New file'}, command = 'DashboardNewFile'},
    b = {description = {' Browse files'}, command = 'Telescope find_files'},
    c = {description = {' Settings'}, command = 'edit $HOME/.config/nvim/init.vim'},
    d = {description = {' Exit'}, command = 'exit'},
}
EOF

" VIMWIKI:
let g:vimwiki_list = [
	\{'path': '~/.wiki/',
	\'syntax': 'markdown',
	\'ext': '.md',
	\'index': 'README',
	\},]
let g:vimwiki_markdown_link_ext = 1

" FZF:
lua <<EOF
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'-u' -- thats the new thing
			},
		}
}
EOF
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <c-n> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" MAPPINGS:
nnoremap Y y$
nnoremap J mzJ`z
nnoremap <leader><leader> <c-^>
nmap <leader>gs :G<CR>

" RUN:
autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te /opt/homebrew/Cellar/gcc/11.2.0_1/bin/aarch64-apple-darwin20-g++-11 -std=c++14 -Wshadow -Wall -o %:t:r % && ./%:t:r<CR>i
" autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i
autocmd filetype python nnoremap <buffer> <C-c> :split<CR>:te python3 '%'<CR>i