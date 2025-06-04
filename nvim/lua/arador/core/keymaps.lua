-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<Leader>ss", "<C-w>p", { noremap = true, silent = true }) -- switches to the previous buffer
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab

keymap.set(
	"n",
	"<leader>tt",
	":rightbelow split | terminal<CR>:resize 15<CR>:startinsert<CR>",
	{ noremap = true, silent = true }
) --open integrated terminal

--Code Runner
local function run_code()
	local filetype = vim.bo.filetype
	local file_name = vim.fn.expand("%")
	-- Open terminal and run code based on filetype
	if filetype == "python" then
		vim.cmd("rightbelow split | term python " .. file_name)
		vim.cmd("resize 15")
		vim.cmd("startinsert")
	elseif filetype == "rust" then
		vim.cmd("rightbelow split | term cargo run")
		vim.cmd("resize 15")
		vim.cmd("startinsert")
	else
		print("Unsupported filetype for running code.")
	end
end

keymap.set("n", "<leader>cr", run_code, { desc = "Run code based on file type" })
