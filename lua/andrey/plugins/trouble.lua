return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle win.position=right<cr>",
			desc = "Open trouble workspace diagnostics",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
			desc = "Symbols (Trouble)",
		},
	},
	config = function()
		local status, trouble = pcall(require, "trouble")
		if not status then
			vim.notify("Failed to load trouble.nvim", vim.log.levels.ERROR)
			return
		end

		trouble.setup({ focus = true })
	end,
}
