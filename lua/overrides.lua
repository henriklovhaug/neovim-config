local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"cpp",
		"markdown",
		"markdown_inline",
		"rust",
		"go",
		"svelte",
		"dockerfile",
		"java",
		"latex",
		"python",
		"json",
		"prisma",
		"sql",
		"regex",
		"kotlin",
		"ron",
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
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettierd",
		"prettier",
		"htmx-lsp",
		--tailwindcss
		"tailwindcss-language-server",

		--python stuff
		"pyright",
		"mypy",
		"ruff",
		"debugpy",
		"isort",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- rust
		"rust-analyzer",
		"codelldb",

		-- svelte
		"svelte-language-server",

		-- Docker compose
		"docker-compose-language-service",
		"dockerfile-language-server",
		"hadolint",

		-- sql
		"sqls",
		"prisma-language-server",
		"sqlfmt",

		-- go
		"gopls",
		"glint",
		"go-debug-adapter",
		"goimports",
		"goimports-reviser",
		"golangci-lint",
		"golangci-lint-langserver",
		"golines",
		"gotests",
		"gotestsum",

		-- java
		"jdtls",
		"google-java-format",
		"java-test",
		"vscode-java-decompiler",
		"java-debug-adapter",
		"checkstyle",

		-- latex
		"texlab",
    "latexindent",

		-- markdown
		"glow",
		"marksman",
		"ltex-ls",
		"harper-ls",

		-- xml
		"xmlformatter",

		-- cli
		"ast-grep",
		"trivy",
		"gitui",
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
	-- preselect = cmp.PreselectMode.None,
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
