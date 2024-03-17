vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

vim.opt.scrolloff = 8
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.fn.setenv("NVIM", "nvim")

vim.g.gutentags_ctags_tagfile = ".tags"
vim.g.gutentags_file_list_command = "rg --files"
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_project_root = { "go.mod", ".git", ".tags" }


local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command

autocmd("FileType", {
	pattern = "markdown",
	command = "set spell",
})

cmd("Qa", function()
	vim.cmd("qa")
end, {})

cmd("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)
