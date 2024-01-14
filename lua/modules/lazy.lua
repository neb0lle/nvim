local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- editor
	"numToStr/Comment.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },

	-- notes TODO
	"jakewvincent/mkdnflow.nvim",
	"dfendr/clipboard-image.nvim",

	-- tmux
	"aserowy/tmux.nvim",

	-- git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim", -- TODO

	-- ui
	"goolord/alpha-nvim",
	"MunifTanjim/nui.nvim",
	{ "folke/noice.nvim", event = "VeryLazy", opts = {} },

	-- syntax
	"nvim-treesitter/nvim-treesitter",
	"onsails/lspkind-nvim",

	-- color
	"NvChad/nvim-colorizer.lua",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- lsp
	"neovim/nvim-lspconfig",

	-- formatting
	"stevearc/conform.nvim",

	-- linting
	"mfussenegger/nvim-lint",

	-- dap
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"rcarriga/cmp-dap",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-emoji",
	"max397574/cmp-greek",

	-- snippets
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

	-- autism
	"s3dman/rundi.nvim",
})
