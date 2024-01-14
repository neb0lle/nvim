require('lint').linters_by_ft = {
	lua = { "selene" },
	rust = { "clippy" },
	go = { "golangcilint" },
	python = { "ruff" },
	sh = { "shellcheck" },

	c = { "clangtidy" }, 
	cpp = { "clangtidy" }, 

	javascript = { "eslint_d" },
	typescript = { "eslint_d" },

	json = { "jsonlint" },
	yaml = { "yamllint" },
	markdown = { "vale" },
}

vim.api.nvim_create_autocmd(
{ "BufReadPost", "BufWritePost", "BufEnter", "InsertLeave", "TextChanged", "FocusGained" ,}
, {
	callback = function()
		require("lint").try_lint()
	end,
})