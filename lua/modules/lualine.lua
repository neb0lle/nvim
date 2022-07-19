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