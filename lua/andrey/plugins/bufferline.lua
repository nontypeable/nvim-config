return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"echasnovski/mini.bufremove",
	},
	opts = function()
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			vim.notify("Failed to load bufferline.nvim", vim.log.levels.ERROR)
			return {}
		end

		return {
			options = {
				tab_size = 15,
				mode = "tabs",
				show_tab_indicators = false,
				show_close_icon = false,
				show_buffer_close_icons = true,

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local indicator = " "
					for severity, num in pairs(diagnostics_dict) do
						local symbol = (severity == "error" and " ") or (severity == "warning" and " ") or " "
						indicator = indicator .. num .. symbol
					end
					return indicator
				end,
			},
		}
	end,
}
