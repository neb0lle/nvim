local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup{
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
		},
}
