return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local success, treesitter = pcall(require, "nvim-treesitter.configs")
		if not success then
			vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
			return
		end

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"go",
				"python",
				"markdown",
				"bash",
				"json",
				"dockerfile",
				"gitignore",
				"javascript",
				"typescript",
				"tsx",
				"toml",
				"yaml",
				"html",
				"css",
				"lua",
			},
		})
	end,
}
