local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "ruff_format" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "deno_fmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		markdown = { "deno_fmt" },
		htmldjango = { "prettier", "djlint" },
		html = { "prettier" },
		css = { "prettier" },
		svelte = { "prettier" },
		astro = { "prettier" },
		scss = { "prettier" },
		yaml = { "prettier" },
		json = { "deno_fmt" },

		java = { "google-java-format" },

		go = { "goimports", "gofmt", "goimports-reviser" },

		sh = { "beautysh" },
		bash = { "beautysh" },

		c = { "clang-format" },
		cpp = { "clang-format" },
		objc = { "clang-format" },
		cuda = { "clang-format" },

		xml = { "xmlformat" },

		sql = { "sqlfmt" },
	},

	formatters = {
		rustfmt = {
			append_args = function()
				return { "--edition", "2024" }
			end,
		},
	},
}

require("conform").setup(options)
