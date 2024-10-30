return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ok, lint = pcall(require, "lint")
		if not ok then
			vim.notify("Failed to load nvim-lint", vim.log.levels.ERROR)
			return
		end

		lint.linters_by_ft = {
			go = { "golangcilint" },
			python = { "ruff" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			dockerfile = { "hadolint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			pattern = "*",
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", lint.try_lint, { desc = "Trigger linting for current file" })
	end,
}
