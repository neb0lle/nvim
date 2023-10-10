vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

-- general
keymap("n","<Y>","y$",opts)
keymap("n","<J>","mzJ`z",opts)
keymap("n","<leader><leader>","<c-^>",opts)
keymap("n","<leader>gs",":G<CR>",opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- telescope
keymap("n","<C-p>","<cmd>Telescope find_files<CR>",opts)
keymap("n","<C-n>","<cmd>Telescope buffers<CR>",opts)
keymap("n","<leader>fg","<cmd>Telescope live_grep<CR>",opts)
keymap("n","<leader>fh","<cmd>Telescope<CR>",opts)

-- autocompile
-- autocmd("FileType", { pattern = "python", 
-- 	callback = function()
-- 		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te python3 '%'<CR>i",opts)
-- 	end})
-- autocmd("FileType", { pattern = "cpp", 
-- 	callback = function()
-- 		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",opts)
-- 	end})
-- autocmd("FileType", { pattern = "c", 
-- 	callback = function()
-- 		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te gcc -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",opts)
-- 	end})

-- autocmd("FileType",	{ pattern = "cpp", command = "nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i"})
-- autocmd filetype cpp nnoremap <buffer> <C-c> :split<CR>:te /opt/homebrew/Cellar/gcc/11.2.0_1/bin/aarch64-apple-darwin20-g++-11 -std=c++14 -Wshadow -Wall -o %:t:r % && ./%:t:r<CR>i
