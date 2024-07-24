local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "ruff_format" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "deno_fmt" },
		typescript = { "deno_fmt" },
		typescriptreact = { "prettier" },
		markdown = { "deno_fmt" },
		htmldjango = { "prettier", "djlint" },
		html = { "prettier" },
		css = { "prettierd" },
		svelte = { "prettier" },
		astro = { "prettier" },
		scss = { "prettierd" },
		yaml = { "prettierd" },
		json = { "deno_fmt" },

		latex = { "latexindent" },

		rust = { "rustfmt" },

		java = { "google-java-format" },

		go = { "goimports", "gofmt", "goimports-reviser" },

		sh = { "beautysh" },

		c = { "clang-format" },
		cpp = { "clang-format" },
		objc = { "clang-format" },
		cuda = { "clang-format" },

		xml = { "xmlformat" },

		sql = { "sqlfmt" },
	},
}

require("conform").setup(options)
