require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		go = { "goimports", "gofmt" },
		python = { "ruff_format" },
		sh = { "shfmt" },

		c = { "clang_format" },
		cpp = { "clang_format" },

		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },

		json = { "prettier" },
		yaml = { "prettier" },
		-- markdown = { "prettier" }, TODO obsidian
		html = { "prettier" },
		css = { "prettier" },

		["*"] = { "codespell" },
		["_"] = { "trim_whitespace", "trim_newlines" },
	},
	formatters = {
		prettier = {
			prepend_args = { "--tab-width", "4", "--use-tabs" },
		},
		clang_format = {
			prepend_args = { "-style", "{BasedOnStyle: LLVM, IndentWidth: 4}" },
		},
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Enable autoformat-on-save",
})
