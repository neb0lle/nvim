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
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-n>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- mkdnflow
autocmd("Filetype",{pattern= "markdown",command = "set awa"})
