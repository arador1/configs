return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			direction = "float", -- Use floating mode
			float_opts = {
				border = "curved", -- Border style (e.g., "single", "double", "curved", etc.)
				width = 80, -- Width of the floating window
				height = 30, -- Height of the floating window
				winblend = 6, -- Transparency level
				zindex = 50, -- Z-index to ensure the floating window is on top
			},
			open_mapping = [[<c-\>]], -- Keybinding to toggle the terminal
			start_in_insert = true, -- Start in insert mode
			close_on_exit = true, -- Close terminal when process exits
			shell = vim.o.shell,
		},
	},
}
