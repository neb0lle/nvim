call plug#begin()
" Syntax:
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
" Completion:
	" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
" Snippets:
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
" Version Control:
	Plug 'tpope/vim-fugitive'
" Theme:
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'glepnir/dashboard-nvim'
" VimWiki:
    Plug 'vimwiki/vimwiki'
" FZF:
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" Misc:
	Plug 'christoomey/vim-tmux-navigator'
call plug#end()

"	General Settings:
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
colorscheme sed
set background=dark
highlight Normal guibg=None
set cmdheight=1
set showtabline=0
set laststatus=2
set noshowmode
set termguicolors
" set colorcolumn=80

" LSP:
" lua require'lspconfig'.clangd.setup{}
" lua require'lspconfig'.pyright.setup{}

" Completion:
" let g:coq_settings = { 'auto_start': 'shut-up' }
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
		require('luasnip').lsp_expand(args.body)
      end,
    },
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
		})
	},
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
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
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF

" Lualine:
lua << EOF
local sed_theme = require'lualine.themes.auto'
sed_theme.normal.a.bg = "#2392FB"
sed_theme.visual.a.bg = "#9966ff"
sed_theme.replace.a.bg = "#ff5555"
sed_theme.normal.a.fg = "#000000"
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = sed_theme,
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

" Treesetter:
lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = {
	enable = true,
	additional_vim_regex_highlighting = false,
	},
	indent = {
	enable = true,
	},
}
EOF

" Dashboard:
highlight dashboardHeader ctermfg=8 guifg=grey
highlight dashboardCenter ctermfg=12 guifg=#2392FB
let g:dashboard_default_executive ='fzf'
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
    b = {description = {' Browse files'}, command = 'Files'},
    c = {description = {' Settings'}, command = 'edit $HOME/.config/nvim/init.vim'},
    d = {description = {' Exit'}, command = 'exit'},
}
EOF

" VimWiki:
let g:vimwiki_list = [
	\{'path': '~/.wiki/',
	\'syntax': 'markdown',
	\'ext': '.md',
	\'index': 'README',
	\},]
let g:vimwiki_markdown_link_ext = 1

" FZF:
" map <C-p> :Files<CR>
" map <C-n> :Buffers<CR>
let g:fzf_buffers_jump = 1
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Mappings:
let mapleader=' '
nnoremap Y y$
nnoremap J mzJ`z
nnoremap <leader><leader> <c-^>
nmap <leader>gs :G<CR>

" Quick Run:
autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te /opt/homebrew/Cellar/gcc/11.2.0_1/bin/aarch64-apple-darwin20-g++-11 -std=c++14 -Wshadow -Wall -o %:t:r % && ./%:t:r<CR>i
" autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i
autocmd filetype python nnoremap <buffer> <C-c> :split<CR>:te python3 '%'<CR>i