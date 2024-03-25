require("nvchad.options")

-- add yours here!

local o = vim.opt

o.termguicolors = true
o.scrolloff = 8
o.smartindent = true

o.hlsearch = false
o.incsearch = true

vim.diagnostic.config({
	update_in_insert = false,
})
