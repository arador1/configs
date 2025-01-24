local o = vim.opt

-- line numbers

o.relativenumber = true
o.number = true

-- tabs and indentation

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- line wrapping

o.wrap = true

-- search settings

o.ignorecase = true
o.smartcase = true

-- cursor line

o.cursorline = true

-- appearance

o.termguicolors = true
--o.background = "dark"
o.signcolumn = "yes"

-- backspace

o.backspace = "indent,eol,start"

--clipboard

o.clipboard:append("unnamedplus")

-- split windows

o.splitright = true
o.splitbelow = true

-- turnoff swapfile

o.swapfile = false

-- auto save for html files

-- Autosave when leaving insert mode or text is changed, only for all files
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = { "*.html", "*.css", "*.js" }, -- Match All the file types
	callback = function()
		if vim.bo.modifiable and not vim.bo.readonly then
			vim.cmd("silent! update") -- Save the file
		end
	end,
})

-- code runner

function _G.run_code()
	local ft = vim.bo.filetype
	local cmd = ""

	-- Define the command for each file type
	if ft == "python" then
		cmd = "python3 " .. vim.fn.expand("%")
	elseif ft == "java" then
		cmd = "javac " .. vim.fn.expand("%") .. " && java " .. vim.fn.expand("%:r")
	elseif ft == "c" then
		cmd = "gcc " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && ./" .. vim.fn.expand("%:r")
	elseif ft == "cpp" then
		cmd = "g++ " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && ./" .. vim.fn.expand("%:r")
	elseif ft == "lua" then
		cmd = "lua " .. vim.fn.expand("%")
	elseif ft == "sh" then
		cmd = "bash " .. vim.fn.expand("%")
	elseif ft == "javascript" then
		cmd = "node " .. vim.fn.expand("%")
	else
		print("Unsupported file type")
		return
	end

	-- Use ToggleTerm to execute the command
	local Terminal = require("toggleterm.terminal").Terminal
	local run_terminal = Terminal:new({
		cmd = cmd,
		direction = "float", -- You can change this to 'horizontal' or 'vertical' if preferred
		close_on_exit = false,
	})

	run_terminal:toggle()
end

-- Lua
vim.g.mapleader = " " -- Sets the leader key to space

--code runner

vim.api.nvim_set_keymap("n", "<leader>cr", ":lua run_code()<CR>", { noremap = true, silent = true })

-- Lua

vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

--autocomment of the following after commenting a line , turn  off

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "setlocal formatoptions-=o formatoptions-=r",
})

o.fillchars:append({
	vert = " ",
})
