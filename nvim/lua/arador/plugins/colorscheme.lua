-- Sonokai Theme
return {
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
