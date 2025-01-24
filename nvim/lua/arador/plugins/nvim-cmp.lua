return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- source for LSP completions
		"onsails/lspkind.nvim", -- for VS Code-like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP source
				{ name = "buffer" }, -- buffer source
				{ name = "path" }, -- file system paths source
			}),
			-- Add VS Code-like pictograms
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text", -- Show symbol and text
					maxwidth = 50, -- Limit popup width
					ellipsis_char = "...", -- Ellipsis for truncated entries
				}),
			},
		})
	end,
}
