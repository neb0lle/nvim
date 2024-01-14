local rundi = require("rundi")

rundi.setup({
	autocompile = {
		python = {
			compiler = "python3",
		},
		cpp = {
			compiler = "g++",
			compiler_args = "-std=c++14 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG",
			output_format = "%:t:r",
		},
		c = {
			compiler = "gcc",
			compiler_args = "-Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG",
			output_format = "%:t:r",
		},
		rust = {
			compiler = "rustc",
			compiler_args = "",
			output_format = "%:t:r",
		},
		javascript = {
			compiler = "node",
		},
	},
	silent = true,
	keymap = "<C-c>",
})
