local M = {}

M.treesitter = {
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"cpp",
		"css",
		"cuda",
		"dockerfile",
		"go",
		"html",
		"htmldjango",
		"java",
		"javascript",
		"json",
		"kotlin",
		"latex",
		"lua",
		"markdown",
		"markdown_inline",
		"prisma",
		"proto",
		"python",
		"regex",
		"ron",
		"rust",
		"scss",
		"sql",
		"svelte",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"yang",
	},
	indent = {
		enable = true,
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},

	view = {
		adaptive_size = true,
		-- To be decided
		-- side = "right",
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	filesystem_watchers = {
		-- enable = false,
		max_events = 100000,
		debounce_delay = 20,
		ignore_dirs = { "/.ccls-cache", "/build", "/node_modules", "/target", "/build/obj", "/.cache" },
	},
}

M.telescope = {
	defaults = {
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
	},
}

local A = require("nvchad.configs.cmp")
local cmp = require("cmp")
table.insert(A.sources, { name = "crates" })

M.cmp = {
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},
	sources = A.sources,
	completion = { completeopt = "menu,menuone,noinsert,noselect" },
}

return M
