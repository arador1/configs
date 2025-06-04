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
o.background = "dark"
o.signcolumn = "yes"

--clipboard

o.clipboard:append("unnamedplus")

-- turnoff swapfile

o.swapfile = false

--o.fillchars:append({
--	vert = " ",
--})
