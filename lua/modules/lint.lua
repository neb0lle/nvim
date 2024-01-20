require("lint").linters_by_ft = {
	-- rust = { "clippy" }, TODO not in nvim-lint docs
	go = { "golangcilint" },
	python = { "ruff" },
	sh = { "shellcheck" },

	-- c = { "clangtidy" },
	-- cpp = { "clangtidy" },

	javascript = { "eslint_d" },
	typescript = { "eslint_d" },

	json = { "jsonlint" },
	yaml = { "yamllint" },
	markdown = { "vale" },
	html = { "vale" },
}

vim.api.nvim_create_autocmd(
	{ "BufReadPost", "BufWritePost", "BufEnter", "InsertLeave", "TextChanged", "FocusGained" },
	{
		callback = function()
			require("lint").try_lint()
		end,
	}
)
