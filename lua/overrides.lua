local M = {}

M.treesitter = {
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Enter>",
			node_incremental = "<Enter>",
			node_decremental = "<BS>",
		},
	},
	ensure_installed = {
		"c",
		"cpp",
		"css",
		"cuda",
		"dockerfile",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"kotlin",
		"latex",
		"lua",
		"markdown",
		"markdown_inline",
		"prisma",
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
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"deno",
		"html-lsp",
		"htmx-lsp",
		"prettier",
		"prettierd",
		"typescript-language-server",

		--tailwindcss
		"tailwindcss-language-server",

		--python stuff
		"debugpy",
		"isort",
		"mypy",
		"pyright",
		"ruff",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- rust
		"codelldb",
		"rust-analyzer",

		-- svelte
		"svelte-language-server",

		-- Docker compose
		"docker-compose-language-service",
		"dockerfile-language-server",
		"hadolint",

		-- sql
		"prisma-language-server",
		"sqlfmt",
		"sqls",

		-- go
		"delve",
		"glint",
		"goimports",
		"goimports-reviser",
		"golangci-lint",
		"golangci-lint-langserver",
		"golines",
		"gopls",
		"gotests",
		"gotestsum",

		-- java
		"checkstyle",
		"google-java-format",
		"java-debug-adapter",
		"java-test",
		"jdtls",
		"vscode-java-decompiler",

		-- latex
		"latexindent",
		"texlab",

		-- markdown
		"glow",
		"harper-ls",
		"ltex-ls",
		"marksman",

		-- xml
		"xmlformatter",

		-- cli
		"ast-grep",
		"gitui",
		"trivy",
		"zk",

		-- shell
		"beautysh",

		-- Pest
		"pest-language-server",
	},
}

-- git support in nvimtree
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
