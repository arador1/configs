return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				bash = { "shfmt" },
			},
			format_on_save = true,
		})
	end,
}
