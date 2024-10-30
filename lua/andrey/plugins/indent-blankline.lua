return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local ok, ibl = pcall(require, "ibl")
		if not ok then
			vim.notify("Failed to load indent-blankline.nvim", vim.log.levels.ERROR)
			return
		end

		ibl.setup({
			indent = { char = "┊" },
		})
	end,
}
