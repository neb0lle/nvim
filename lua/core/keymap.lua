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

-- mkdnflow
autocmd("Filetype",{pattern= "markdown",command = "set awa"})
