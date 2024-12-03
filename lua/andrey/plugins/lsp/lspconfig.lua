return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- lsp completion source for nvim-cmp
	},
	config = function()
		local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
		if not lspconfig_ok then
			vim.notify("lspconfig is not installed.", vim.log.levels.ERROR)
			return
		end

		local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not cmp_nvim_lsp_ok then
			vim.notify("cmp-nvim-lsp is not installed.", vim.log.levels.ERROR)
			return
		end

		-- code diagnostic icons (meslo lg nerd font family should be used)
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- setup for go language server (gopls)
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
		})

		-- setup for js & ts language server (ts_ls)
		lspconfig.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			settings = {
				format = {
					enable = true,
				},
				rootMarkers = { ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml" },
			},
		})
	end,
}
