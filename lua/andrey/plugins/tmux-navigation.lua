return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local ok, nvim_tmux_navigation = pcall(require, "nvim-tmux-navigation")
		if not ok then
			vim.notify("Failed to load nvim-tmux-navigation", vim.log.levels.ERROR)
			return
		end

		nvim_tmux_navigation.setup({})

		vim.keymap.set("n", "<C-h>", nvim_tmux_navigation.NvimTmuxNavigateLeft, { desc = "Navigate Left" })
		vim.keymap.set("n", "<C-j>", nvim_tmux_navigation.NvimTmuxNavigateDown, { desc = "Navigate Down" })
		vim.keymap.set("n", "<C-k>", nvim_tmux_navigation.NvimTmuxNavigateUp, { desc = "Navigate Up" })
		vim.keymap.set("n", "<C-l>", nvim_tmux_navigation.NvimTmuxNavigateRight, { desc = "Navigate Right" })
		vim.keymap.set("n", "<C-\\>", nvim_tmux_navigation.NvimTmuxNavigateLastActive, { desc = "Last Active" })
		vim.keymap.set("n", "<C-Space>", nvim_tmux_navigation.NvimTmuxNavigateNext, { desc = "Next Pane" })
	end,
}
