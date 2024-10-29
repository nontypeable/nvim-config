return {
	"stevearc/conform.nvim",
	config = function()
		local success, conform = pcall(require, "conform")
		if not success then
			vim.notify("Failed to load conform.nvim", vim.log.levels.ERROR)
			return
		end

		conform.setup({
			formatters_by_ft = {
				go = { "gofmt", "goimports", "golines" },
				python = { "black" },
				markdown = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true, -- use lsp for formatting if available
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range." })
	end,
}
