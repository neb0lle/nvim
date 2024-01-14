local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-u", -- that's the new thing
		},
	},
})

vim.keymap.set("n", "<C-n>", builtin.buffers, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fj", ":Telescope<CR>", {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

