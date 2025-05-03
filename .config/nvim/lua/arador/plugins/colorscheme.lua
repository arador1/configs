-- Sonokai Theme
return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Enable Nord colorscheme
			--		vim.cmd("colorscheme nord")

			-- Set Nord-specific options
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		flavour = "frappe",
		config = function()
			vim.cmd("colorscheme catppuccin-frappe")
		end,
	},
}
