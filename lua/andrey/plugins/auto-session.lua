return {
	"rmagatti/auto-session",
	config = function()
		local ok, auto_session = pcall(require, "auto-session")
		if not ok then
			vim.notify("Failed to load auto-session", vim.log.levels.ERROR)
			return
		end

		auto_session.setup({
			auto_restore_enabled = true,
		})

		vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
