return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope_ok, telescope = pcall(require, "telescope")
		if not telescope_ok then
			vim.notify("Failed to load telescope.nvim", vim.log.levels.ERROR)
			return
		end

		local actions_ok, actions = pcall(require, "telescope.actions")
		if not actions_ok then
			vim.notify("Failed to load telescope.actions", vim.log.levels.ERROR)
			return
		end

		local transform_mod_ok, transform_mod = pcall(require, "telescope.actions.mt")
		if not transform_mod_ok then
			vim.notify("Failed to load telescope.actions.mt", vim.log.levels.ERROR)
			return
		end

		local trouble_ok, trouble = pcall(require, "trouble")
		if not trouble_ok then
			vim.notify("Failed to load trouble.nvim", vim.log.levels.ERROR)
			return
		end

		local trouble_telescope_ok, trouble_telescope = pcall(require, "trouble.sources.telescope")
		if not trouble_telescope_ok then
			vim.notify("Failed to load trouble sources for telescope", vim.log.levels.ERROR)
			return
		end

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- revert to the previous result
						["<C-j>"] = actions.move_selection_next, -- move on to the next result
						["<C-t>"] = trouble_telescope.open, -- problems in the selected file
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in cwd" }
		)
	end,
}
