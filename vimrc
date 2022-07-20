call plug#begin()
" SYNTAX:
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"	General Settings:
syntax on
filetype plugin indent on


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
