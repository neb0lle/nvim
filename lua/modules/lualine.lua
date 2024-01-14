
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		always_divide_middle = true,
		section_separators = '',
		component_separators = '',
	},
	extensions = { -- TODO
		'fugitive',
		'fzf',
	},
}