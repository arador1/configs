return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "shaunsingh/nord.nvim" },
	version = "*",
	opts = function()
		-- Load Nord highlights after nord.nvim is initialized
		local nord_highlights = require("nord").bufferline.highlights({
			italic = true, -- Enable italics for buffer text
			bold = true, -- Enable bold text
		})

		return {
			options = {
				mode = "tabs",
				separator_style = "thin",
				color_icons = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "NvimTree",
						text_align = "left",
						separator = false,
					},
				},
			},
			highlights = nord_highlights, -- Apply Nord highlights here
		}
	end,
}
