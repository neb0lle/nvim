require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	ignore_install = {"phpdoc",},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {"python",} }
}
