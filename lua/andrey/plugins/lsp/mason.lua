return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
    config = function()
        local mason_ok, mason = pcall(require, "mason")
        if not mason_ok then
            vim.notify("Failed to load mason.", vim.log.levels.ERROR)
            return
        end

        local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mason_lspconfig_ok then
            vim.notify("Failed to load mason-lspconfig.", vim.log.levels.ERROR)
            return
        end

        local mason_tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
        if not mason_tool_installer_ok then
            vim.notify("Failed to load mason-tool-installer.", vim.log.levels.ERROR)
            return
        end

        -- configure mason ui
        mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

        -- mason-lspconfig installs the following language servers
        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",  -- python language server
                "gopls",    -- golang language server
                "ts_ls",    -- js & ts language server
            },
        })

        -- mason-tool-installer installs the following external tools
        mason_tool_installer.setup({
            ensure_installed = {
                "goimports",        -- go import formatter
                "golines",          -- go formatter for long lines
                "golangci-lint",    -- go linter

                "black",            -- python formatter
                "pylint",           -- python linter

                "prettier",         -- formatter for js and other languages
                "eslint_d",         -- js linter

                "stylua",           -- lua formatter
            },
        })
    end,
}
