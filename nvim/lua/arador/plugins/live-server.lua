return {
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server", -- Ensure you have pnpm installed, or change to npm if needed
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = function()
			require("live-server").setup({
				-- Specify your options here if needed
				-- e.g., port = 5500, root = ".", quiet = false, etc.
			})
			-- Keybindings for live server

			vim.g.mapleader = " "
			local keymap = vim.keymap
			keymap.set("n", "<leader>bo", "<cmd>LiveServerStart<CR>", { desc = "Live Server Start" })
			keymap.set("n", "<leader>bc", "<cmd>LiveServerStop<CR>", { desc = "Live Server Stop" })
		end,
	},
}
