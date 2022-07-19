vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

keymap("n","<Y>","y$",opts)
keymap("n","<J>","mzJ`z",opts)
keymap("n","<leader><leader>","<c-^>",opts)
keymap("n","<leader>gs",":G<CR>",opts)

autocmd("FileType", { pattern = "python", 
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te python3 '%'<CR>i",opts)
	end})
autocmd("FileType", { pattern = "cpp", 
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",opts)
	end})

-- autocmd("FileType",	{ pattern = "cpp", command = "nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i"})
-- autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te /opt/homebrew/Cellar/gcc/11.2.0_1/bin/aarch64-apple-darwin20-g++-11 -std=c++14 -Wshadow -Wall -o %:t:r % && ./%:t:r<CR>i
