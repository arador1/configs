-- Sonokai Theme
return {
	{ --   -- https://github.com/sainnhe/sonokai
		"sainnhe/sonokai",
		lazy = false, -- We want the colorscheme to load immediately when starting Neovim
		priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
		config = function(_, opts)
			vim.g.sonokai_style = "default" -- "default, atlantis, andromeda, shusia, maia, espresso"
			--	vim.cmd("colorscheme sonokai") -- Replace this with your favorite colorscheme
		end,
	},

	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Enable Nord colorscheme
			--vim.cmd("colorscheme nord")

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
