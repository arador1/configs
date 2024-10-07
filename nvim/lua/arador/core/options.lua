vim.cmd("let g:netrw_liststyle = 3")

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

o.wrap = false

-- search settings

o.ignorecase = true
o.smartcase = true

-- cursor line

o.cursorline = true

-- appearance

o.termguicolors = true
o.background = "dark"
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

-- Autosave when leaving insert mode or text is changed, only for HTML files
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = { "*.html", "*.css" }, -- Match only HTML files
	callback = function()
		if vim.bo.modifiable and not vim.bo.readonly then
			vim.cmd("silent! update") -- Save the file
		end
	end,
})

-- Lua
vim.g.mapleader = " " -- Sets the leader key to space

-- Lua
vim.api.nvim_set_keymap(
	"n",
	"<leader>tt",
	":split | terminal<CR>:resize 30<CR>:startinsert<CR>",
	{ noremap = true, silent = true }
)

o.fillchars:append({
	vert = " ",
})
